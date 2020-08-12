package com.worldNavigator.model.dataBase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@Component
@Scope("singleton")
public class DataProvider {

    @Autowired
    private DataSource dataSource;
    private static Connection con;
    private static DataProvider instance = new DataProvider();

    private DataProvider() { //singleton
    }

    @PostConstruct
    private void postConstruct() {
        Statement st = null;
        try {
            con = dataSource.getConnection();
            st = con.createStatement();
        } catch (SQLException e) {
            System.out.println("No DataBase Connection!");
            e.printStackTrace();
        }

    }

    public void addUser(String name, String email, String password) {
        if (name == null)
            throw new NullPointerException();
        if (email == null)
            throw new NullPointerException();
        if (password == null)
            throw new NullPointerException();

        if (userExist(email))
            throw new IllegalArgumentException("This use already exist");


        Statement st = null;
        try {
            st = con.createStatement();
            st.executeUpdate(String.format("INSERT INTO users (fname, email, pass, wins) VALUES ('%s', '%s', '%s', %d)", name, email, hashPassword(password), 0));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean userExist(String email) {
        boolean exist = false;
        if (email == null)
            throw new NullPointerException();
        try {
            Statement st = con.createStatement();
            ResultSet result = st.executeQuery("SELECT * from users WHERE email = \"" + email + "\"");
            exist = result.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exist;
    }

    public boolean successfulLogin(String email, String password) {

        Statement st = null;
        ResultSet result = null;
        try {
            st = con.createStatement();
            result = st.executeQuery(String.format("SELECT * FROM users WHERE email = '%s' AND pass = '%s'", email, hashPassword(password)));
            return result.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public String getFname(String email) {

        if (email == null)
            throw new NullPointerException("email value is null!");

        if (!userExist(email))
            throw new IllegalArgumentException("this email doesn't exist in the database!");

        Statement st = null;
        ResultSet result = null;

        try {
            st = con.createStatement();
            result = st.executeQuery(String.format("SELECT * FROM users WHERE email = '%s'", email));
            if (result.next()) {
                return result.getString("fname");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "";
    }

    public String getId(String email) {
        if (email == null)
            throw new NullPointerException("email value is null!");

        if (!userExist(email))
            throw new IllegalArgumentException("this email doesn't exist in the database!");

        Statement st = null;
        ResultSet result = null;

        try {
            st = con.createStatement();
            result = st.executeQuery(String.format("SELECT * FROM users WHERE email = '%s'", email));
            if (result.next()) {
                return result.getString("id");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "";
    }

    public void addWin(int id) {
        Statement st = null;
        try {
            st = con.createStatement();
            st.executeUpdate("UPDATE users SET wins = wins + 1 WHERE id = " + id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String hashPassword(String password) {
        if (password == null)
            throw new NullPointerException("password value is null!");

        try {
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(password.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }

        // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }


    public int getNumberOfWins(String email) {
        if (email == null)
            throw new NullPointerException("email value is null!");

        if (!userExist(email))
            throw new IllegalArgumentException("this email doesn't exist in the database!");

        Statement st = null;
        ResultSet result = null;

        try {
            st = con.createStatement();
            result = st.executeQuery(String.format("SELECT * FROM users WHERE email = '%s'", email));
            if (result.next()) {
                return Integer.parseInt(result.getString("wins"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public DataSource getDataSource() {
        return dataSource;
    }

    public static DataProvider getInstance() {
        return instance;
    }

}
