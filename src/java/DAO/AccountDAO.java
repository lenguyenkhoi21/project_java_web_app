/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Milu
 */
public class AccountDAO {
    // Lấy tài khoản trong CSDL thông bằng tên đăng nhập
    public Account getAccountByUsername(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From Account where tenDangNhap = :u";
            Query query = session.createQuery(hql);
            query.setParameter("u", username);
            Account user = (Account) query.uniqueResult();
            if (user!=null) {
                System.out.println(user.toString());
                return user;
            } else {
                return null;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    // Xác thực đăng nhập
    public Account auth(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From Account where tenDangNhap = :u and matKhau = :p";
            Query query = session.createQuery(hql);
            query.setParameter("u", username);
            query.setParameter("p", password);
            Account user = (Account) query.uniqueResult();
            if (user!=null) {
                System.out.println(user.toString());
                return user;
            } else {
                return null;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    // Lấy danh sách người dùng
    public List getAllAccount() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From Account";
            Query query = session.createQuery(hql);
            List result = query.list();
            if (result!=null) {
                for (Iterator iterator = result.iterator(); iterator.hasNext();) {
                    Account next = (Account) iterator.next();
                    next.toString();
                }
                return result;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    // Đăng ký người dùng
    public boolean addAccount (String username, String password, String email, String phone, String address, String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Account acc = new Account(username, password, email, phone, address, name);
            session.save(acc);
            transaction.commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
        }
        return false;
    }
    // Cập nhật thông tin người dùng
    public boolean updateAccount(String username, String password, String name, String address, String phone, String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Account acc = (Account) session.get(Account.class, username);
            acc.setTenKhachHang(name);
            acc.setDiaChi(address);
            acc.setPhone(phone);
            acc.setEmail(email);
            acc.setMatKhau(password);
            transaction.commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
        }
        return false;
    }
}
