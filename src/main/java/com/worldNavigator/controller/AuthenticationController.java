package com.worldNavigator.controller;

import com.worldNavigator.model.dataBase.DataProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
        session.setAttribute("user_id", dataProvider.getId(email));
        session.setAttribute("user_first_name", dataProvider.getFname(email));
        session.setAttribute("user_email", email);

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
