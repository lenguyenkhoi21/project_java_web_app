/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.NguonCap;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Milu
 */
public class NguonCapDAO {
	// Lấy tất cả nguồn cấp từ CSDL
    public List getAllNguonCap() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From NguonCap";
            Query query = session.createQuery(hql);
            List result = query.list();
            if (result != null) {
                return result;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    // Tự  động sinh ID nếu thêm nguồn cấp mới
    public String getLastID() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From NguonCap order by nguoncapId DESC";
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            NguonCap last = (NguonCap) query.uniqueResult();
            String idLast = last.getNguoncapId();
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
            if (newID.length()==2) {
                newID = "NC0" + newID;
            } else {
                newID = "NC" + newID;
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
    // Lấy nguồn cấp thông qua ID
    public NguonCap getNguonCapById(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From NguonCap " + "where nguoncapId = :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            NguonCap sp;
            sp = (NguonCap) query.uniqueResult();
            if (sp!=null) {
                System.out.println( sp.toString());
                return sp;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return  null;
    }
    // Thêm nguồn cấp mới vào
    public boolean addNguonCap(String id, String name, String address, String phone) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            NguonCap nc = new NguonCap(id, name, address, phone);
            session.save(nc);
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
    //Cập nhật nguồn cấp
    public boolean updateNguonCap(String id, String name, String address, String phone) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            NguonCap nc = (NguonCap) session.get(NguonCap.class, id);
            nc.setNguoncapName(name);
            nc.setNguonCapAddress(address);
            nc.setNguonCapPhone(phone);
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
