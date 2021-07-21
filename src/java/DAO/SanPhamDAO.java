/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.NguonCap;
import Model.SanPham;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Milu
 */
public class SanPhamDAO {
	//Lấy danh sách các thể loại
    public List getListtheloai() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "Select loaiSanPham From SanPham " + "Group by loaiSanPham";
            Query query = session.createQuery(hql);
            List result = query.list();
            if (result != null) {
                for (Iterator i = result.iterator(); i.hasNext();) {
                    String theloai = (String) i.next();
                    System.out.println(theloai);
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
    // Lấy danh sách phẩn hot
    public List getSamPhamhot() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From SanPham";
            Query query = session.createQuery(hql);
            query.setMaxResults(9);
            List result = query.list();
            if (result != null) {
                for (Iterator i = result.iterator(); i.hasNext();) {
                    SanPham item = (SanPham) i.next();
                    System.out.println(item.toString());
                }
                return result;
            } 
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return  null;
    }
    // Lấy danh sách sản phẩm theo thể loại
    public List getSanPhamByTheLoai(String theloai) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From SanPham " + "where loaiSanPham = :theloai";
            Query query = session.createQuery(hql);
            query.setParameter("theloai", theloai);
            List result = query.list();
            if (result != null) {
                for (Iterator i = result.iterator(); i.hasNext();) {
                    SanPham item = (SanPham) i.next();
                    System.out.println(item.toString());
                }
                return result;
            } 
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return  null;
    }
    // Lấy một sản phẩm theo id
    public SanPham getSanPhamById(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From SanPham " + "where maSanPham = :id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            SanPham sp;
            sp = (SanPham) query.uniqueResult();
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
    // Lấy tất cả sản phẩm trong CSDL
    public List getAllSanPHam() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From SanPham";
            Query query = session.createQuery(hql);
            List result = query.list();
            if (result != null) {
                for (Iterator i = result.iterator(); i.hasNext();) {
                    SanPham item = (SanPham) i.next();
                    System.out.println(item.getNguonCap().getNguoncapName());
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
    // Tự động sinh ra ID
    public String getLastId() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From SanPham order by maSanPham DESC";
            Query query = session.createQuery(hql);
            query.setMaxResults(1);
            SanPham last = (SanPham) query.uniqueResult();
            String idLast = last.getMaSanPham();
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
                newID = "SP0" + newID;
            } else {
                newID = "SP" + newID;
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
    //Thêm sản phẩm
    public  boolean addSanPham(String id, String name, String type, int price, int amount, String state, String nguoncap, String url) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            NguonCap nc = (NguonCap) session.get(NguonCap.class, nguoncap);
            SanPham t;
            t = new SanPham(id, null, name, type, price, amount, state, url);
            t.setNguonCap(nc);
            session.save(t);
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
    // Cập nhật
    public boolean updateSanPham(String id, String name, String type, int price, Integer amount, String state, String nguoncap, String url) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            NguonCap nc = (NguonCap) session.get(NguonCap.class, nguoncap);
            SanPham sp = (SanPham) session.get(SanPham.class, id);
            sp.setSanPhamName(name);
            sp.setLoaiSanPham(type);
            sp.setGiaNiemYet(price);
            sp.setTongSoLuong(amount);
            sp.setTrangThai(state);
            sp.setNguonCap(nc);
            sp.setUrl(url);
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
    // Tìm kiếm 
    public ArrayList<SanPham> searchSanPham(String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        ArrayList<SanPham> id = new ArrayList<SanPham>();
        try {
            String hql = "From SanPham where SanPhamName like :n ";
            Query query = session.createQuery(hql);
            query.setParameter("n", "%" + name + "%");
            List result = query.list();
            int i = 0;

//            System.out.printf("%-10s%-40s%-40s%-20s%-20s%-10s%-20s\n",
//                    "Ma San Pham",
//                    "Ten San Pham",
//                    "Loai San Pham",
//                    "Gia Niem Yet",
//                    "Tong So Luong",
//                    "Trang Thai",
//                    "Ma Nguon Cap"
//            );
            for (Iterator iterator = result.iterator(); iterator.hasNext();) {
                Object next = iterator.next();
                SanPham test = (SanPham) next;
//                System.out.printf("%-10s%-40s%-40s%-20d%-20d%-10s%-20s\n",
//                        test.getMaSanPham(),
//                        test.getSanPhamName(),
//                        test.getLoaiSanPham(),
//                        test.getGiaNiemYet(),
//                        test.getTongSoLuong(),
//                        test.getTrangThai(),
//                        test.getNguonCap().getNguoncapName()
//                );
                id.add(test);
                i++;
            }
//            System.out.println("So ket qua tim thay: " + i);
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return id;
    }

}
