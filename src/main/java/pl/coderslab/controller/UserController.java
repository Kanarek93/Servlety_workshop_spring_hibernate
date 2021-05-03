package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.dao.UserDao;
import pl.coderslab.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserDao userDao;

    public UserController(UserDao userDao) {
        this.userDao = userDao;
    }

    @GetMapping("/list")
    public String listUsers(Model model){
        model.addAttribute("userList", userDao.getAll());
        return "userList";
    }

    @GetMapping("/add")
    public String addUserForm(Model model){
        model.addAttribute("user",new User());
        return "addUserForm";
    }

    @PostMapping("/add")
    public String addUser(User user){
        userDao.create(user);
        return "redirect:/user/list";
    }

    @GetMapping("/delete/{id}")
    public String removeUser(@PathVariable Integer id){
        userDao.removeById(id);
        return "redirect:/user/list";
    }

    @GetMapping("/edit/{id}")
    public String editUserForm(@PathVariable Integer id, Model model){
        User u = userDao.getById(id).orElseThrow(RuntimeException::new);
        model.addAttribute("user", u);
        return "editUserForm";
    }

    @PostMapping("/edit")
    public String editUserForm(User user){
        userDao.update(user);
        return "redirect:/user/list";
    }

    @GetMapping("/show/{id}")
    public String showUser(@PathVariable Integer id, Model model){
        User u = userDao.getById(id).orElseThrow(RuntimeException::new);
        model.addAttribute("user", u);
        return "userDetails";
    }
}
