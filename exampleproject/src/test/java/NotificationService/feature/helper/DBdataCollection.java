package NotificationService.feature.helper;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

import net.minidev.json.JSONObject;

import org.springframework.jdbc.core.JdbcTemplate;


public class DBdataCollection {


    public static JSONObject getUsernameAndPassword(){
        final JdbcTemplate jdbc;
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/APIDevelop");
        dataSource.setUsername("root");
        dataSource.setPassword("Ali22@@isnice");
        jdbc = new JdbcTemplate(dataSource);
        return new JSONObject(jdbc.queryForMap("SELECT * FROM Users"));

        

    }
    
}
