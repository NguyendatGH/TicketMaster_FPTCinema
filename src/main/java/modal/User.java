package modal;

public class User {

    private int id;
    private String username;
    private String password;
    private String email;
    private int role_id;

    public User(String username, String password, String email, int role_id) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.role_id = role_id;
    }

    public User() {
    }

    public User(int id, String username, String password, String email, int role_id) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role_id = role_id;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", role_id=" + role_id + '}';
    }

}
