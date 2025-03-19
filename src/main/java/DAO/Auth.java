package DAO;

import modal.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Auth {

    public static User getUser(String Input_email, String Input_password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        if (pool == null) {
            System.out.println("error, pool is null");
        }
        Connection connection = pool.getConnection();

        if (connection == null) {
            System.out.println("error, connection is null");
        }

        String sqlString = "Select * from Users where email =? and password_hash = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        try {
            ps = connection.prepareStatement(sqlString);
            ps.setString(1, Input_email);
            ps.setString(2, Input_password);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password_hash");
                String email = rs.getString("email");
                int role = rs.getInt("role_id");
                u = new User(id, username, password, email, role);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            DBUtils.closePreparedStatement(ps);
            DBUtils.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return u;
    }

    public static User getUserByEmail(String Input_email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        if (pool == null) {
            System.out.println("error, pool is null");
        }
        Connection connection = pool.getConnection();

        if (connection == null) {
            System.out.println("error, connection is null");
        }

        String sqlString = "Select * from Users where email =?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        try {
            ps = connection.prepareStatement(sqlString);
            ps.setString(1, Input_email);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password_hash");
                String email = rs.getString("email");
                int role = rs.getInt("role_id");
                u = new User(id, username, password, email, role);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            DBUtils.closePreparedStatement(ps);
            DBUtils.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return u;
    }

    public static int CreateAccount(User u) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        String sqlString = "Insert into Users(username, email, password_hash, role_id) values(?,?,?,?)";
        PreparedStatement ps = null;
        ResultSet rs = null;

        int user_id = -1;

        try {
            ps = connection.prepareStatement(sqlString, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setInt(4, u.getRole_id());

            int rowsInserted = ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rowsInserted > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    user_id = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeResultSet(rs);
            DBUtils.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return user_id;
    }

}
