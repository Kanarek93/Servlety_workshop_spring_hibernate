package pl.coderslab.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.mindrot.jbcrypt.BCrypt;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter @Setter
@ToString

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String email;
    private String username;
    private String password;

    public User(String email, String username, String password) {

        this.email = email;
        this.username = username;
        this.password = hashPassword(password);
        this.id = 0;
    }

    public User() {}

    //zahashowie hasła
    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    //sprawdzanie formatu emaila
    private boolean isEmail (String address) {
        if (address.matches(
                "[_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.([a-zA-Z]{2,}){1}")){
            return true;
        }
        else {
            System.out.println("Wprowadzona dana nie ma formatu adresu email");
            return false;
        }
    }


}

