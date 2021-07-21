/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Chitiethoadon;
import Model.HoaDon;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.chart.PieChart;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Milu
 */
public class HoaDonDAO {
	// Lấy tất cả hóa đơn của của một khác hàng
    public List getDSHoaDon(String username) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction t = null;
        try {
            t = session.beginTransaction();
            String hql = "From HoaDon where account = :username";
            Account a = (Account) session.get(Account.class, username) ;
            Query query = session.createQuery(hql);
            query.setParameter("username", a);
            List result = query.list();
            if (result!=null) {
                for (Iterator iterator = result.iterator(); iterator.hasNext();) {
                    HoaDon next = (HoaDon) iterator.next();
                    System.out.println(next.toString());
                }
            }
            t.commit();
            return result;
        } catch (HibernateException e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return null;
    }
    // Tạo id hóa đơn mới 
    public String getLastID() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From HoaDon order by maHoaDon DESC";
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            HoaDon last = (HoaDon) query.uniqueResult();
            String idLast = last.getMaHoaDon();
            String number = "";
            for (int i=0; i <  idLast.length(); i++) {
                char x = idLast.charAt(i);
                if (x <= '9' && x >= '0') {
                    number = number + x;
                }
            }
            int newNumber = Integer.valueOf(number);
            newNumber++;
            String newID = String.valueOf(newNumber);
            
            if (newID.length()==1) {
                newID = "HD00" + newID;
            } else {
                if (newID.length()==2) {
                    newID = "HD0" + newID;
                } else {
                    newID = "HD" + newID;
                }
                
            }
            
            System.out.println(newID);
            
            return newID;
            
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    // Thêm hóa đơn mới vào
    public  boolean addHoaDon(String id, String idACC, java.sql.Date date) throws ParseException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Account sp = (Account) session.get(Account.class, idACC);
            HoaDon hd;
            hd = new HoaDon(id, null, date);
            hd.setAccount(sp);
            session.save(hd);
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
    
    public java.sql.Date currentDate() {
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        return date;
    }
    
}
