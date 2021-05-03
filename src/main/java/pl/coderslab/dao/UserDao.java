package pl.coderslab.dao;

import org.springframework.stereotype.Repository;
import pl.coderslab.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public class UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void create(User user){
        entityManager.persist(user);
    }

    public void update(User user){
        entityManager.merge(user);
    }

    public Optional<User> getById(Integer id){
        return Optional.ofNullable((User) entityManager.find(User.class, id));
    }

    public List<User> getAll(){
        Query query = entityManager.createQuery("select u from User u");
        return query.getResultList();
    }

    public void removeById(Integer id){
        getById(id).ifPresent(entityManager::remove);
    }

    public void remove (User user){
        entityManager.remove(entityManager.contains(user) ?
                user : entityManager.merge(user));
    }

}
