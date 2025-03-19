package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
public class ConfigLoader {
    private static final Properties properties = new Properties();

    static {
        try (InputStream input = ConfigLoader.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                throw new IOException("config.properties file not found in classpath");
            }
            else{
                System.out.println("~~~~~~" +input);
            }
            properties.load(input);
        } catch (IOException e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("Failed to load configuration");
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}