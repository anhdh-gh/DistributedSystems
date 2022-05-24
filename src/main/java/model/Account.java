package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class Account {
    private final int id;
    private final String username;
    private final String password;

    private Account(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }
 
    private static final List<Account> accounts = new ArrayList<>(Arrays.asList(
        new Account(1, "Đỗ Hùng Anh", "Đỗ Hùng Anh"),
        new Account(2, "anonymous", "anonymous")
    ));
    
    public static Account authentication(String username, String password) {
        for (Account account : accounts) 
            if(account.username.equals(username) && account.password.equals(password))
                return account;
        
        return null;
    }

    public static List<Account> getAccounts() {
        return accounts;
    }
}