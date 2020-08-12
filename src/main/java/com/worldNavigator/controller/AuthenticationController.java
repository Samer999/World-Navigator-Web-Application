package com.worldNavigator.controller;

import com.worldNavigator.model.dataBase.DataProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@Controller
public class AuthenticationController {

    @PostMapping("/Login")
    public String login(HttpServletRequest request) {

        String email = request.getParameter("loginEmail");
        String password = request.getParameter("loginPassword");
        System.out.println(email + " " + password);
        String loginError = null;
        clearAttributes(request);

        if (email == null || password == null) {
            loginError = "Fill all information!";
            request.setAttribute("loginError", loginError);
            return "index";
        }

        DataProvider dataProvider = DataProvider.getInstance();

        if (!dataProvider.userExist(email)) {
            loginError = "This email is not registered!";
            request.setAttribute("loginError", loginError);
            return "index";
        } else if (!dataProvider.successfulLogin(email, password)) {
            loginError = "Wrong password entered!";
            request.setAttribute("loginError", loginError);
            return "index";
        }

        HttpSession session = request.getSession();
        String user_id = dataProvider.getId(email);
        String user_first_name = dataProvider.getFname(email);
        String user_email = email;
        int user_wins = dataProvider.getNumberOfWins(email);
        session.setAttribute("user_id", dataProvider.getId(email));
        session.setAttribute("user_first_name", dataProvider.getFname(email));
        session.setAttribute("user_email", email);
        session.setAttribute("user_wins", user_wins);
        return "welcome";
    }

    @PostMapping("/Register")
    public String register(HttpServletRequest request) {

        String fname = request.getParameter("registerFname");
        String email = request.getParameter("registerEmail");
        String password = request.getParameter("registerPassword");
        String password2 = request.getParameter("registerConfirmPassword");
        String registerError = null;
        clearAttributes(request);

        if (fname == null || email == null || password == null) {
            registerError = "Fill all information!";
            request.setAttribute("registerError", registerError);
            return "index";
        }

        if (!password.equals(password2))
            registerError = "The two passwords are not equal!";


        if (password.length() < 6)
            registerError = "Password length is less than 6 characters!";

        if (fname.length() < 3)
            registerError = "First name length is less that 3 characters!";


        DataProvider dataProvider = DataProvider.getInstance();
        if (dataProvider.userExist(email))
            registerError = "This Email is already registered!";


        if (registerError != null) {
            request.setAttribute("registerError", registerError);
            return "index";
        }

        dataProvider.addUser(fname, email, password);

        HttpSession session = request.getSession();
        session.setAttribute("user_id", dataProvider.getId(email));
        session.setAttribute("user_first_name", dataProvider.getFname(email));
        session.setAttribute("user_email", email);
        session.setAttribute("user_wins", 0);

        return "welcome";
    }

    @RequestMapping("/Logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("user_id", null);
        session.setAttribute("user_first_name", null);
        session.setAttribute("user_email", null);
        return "index";
    }



    private void clearAttributes(HttpServletRequest request) {
        Enumeration<String> attributes = request.getAttributeNames();
        while (attributes.hasMoreElements()) {
            String ele = attributes.nextElement();
            System.out.println(ele);
            request.removeAttribute(ele);
        }
    }
}
