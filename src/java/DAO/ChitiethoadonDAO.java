/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Chitiethoadon;
import Model.ChitiethoadonId;
import Model.HoaDon;
import Model.SanPham;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.function.Consumer;


/**
 *
 * @author Milu
 */
public class ChitiethoadonDAO {
	// Xem thông tin một hóa đơn qua một mã hóa đơn
    public List viewChiTietHoaDon(String idHD) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "From Chitiethoadon where MaHoaDon = :i";
            Query query = session.createQuery(hql);
            query.setParameter("i", idHD);
            List result = query.list();
            Chitiethoadon cthd;
            HoaDon hd;
            hd = (HoaDon) session.get(HoaDon.class, idHD);

            System.out.println("Ma Hoa Don: " + idHD);
            System.out.println("Ngay tao: " + hd.getNgayTao());
            System.out.printf("%-40s%-40s%-40s%-20s%-20s%-10s%-20s\n",
                    "Ten Tai Khoan",
                    "Ten Khach Hang",
                    "Ma San Pham",
                    "Ten San Pham",
                    "Loai",
                    "So Luong",
                    "Thanh Tien"
            );
            for (Iterator iterator = result.iterator(); iterator.hasNext();) {
                Object next = iterator.next();
                cthd = (Chitiethoadon) next;
                System.out.printf("%-40s%-40s%-40s%-20s%-20s%-10d%-20d\n",
                        cthd.getHoaDon().getAccount().getTenDangNhap(),
                        cthd.getHoaDon().getAccount().getTenKhachHang(),
                        cthd.getSanPham().getMaSanPham(),
                        cthd.getSanPham().getSanPhamName(),
                        cthd.getSanPham().getLoaiSanPham(),
                        cthd.getSoLuong(),
                        cthd.getSoLuong() * cthd.getSanPham().getGiaNiemYet()
                );
            }
            return result;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
	
    // Thêm vào bảng chi tiết hoa đơn chung với cái addtoDB
    public boolean createChiTietHoaDon(HashMap<String, Integer> hs, String idHD) {
        String[] sanpham = new String[hs.size()];
        Integer[] sl = new Integer[hs.size()];
        hs.entrySet().forEach(new Consumer<Entry<String, Integer>>() {
            int i = 0;
            @Override
            public void accept(Entry<String, Integer> entry) {
                sanpham[i] = entry.getKey();
                sl[i] = entry.getValue();
                i++;
            }
        });
        for (int j = 0; j < sanpham.length; j++) {
            addToDB(sanpham[j], sl[j], idHD);
            if (j == sanpham.length - 1)
                return true;
        }
        return false;
    }
	 // Thêm vào bảng chi tiết hoa đơn
    public void addToDB(String sanpham, Integer sl, String idHD) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SanPham sp;
            HoaDon hd;
            ChitiethoadonId ct;
            Chitiethoadon cthd;
            hd = (HoaDon) session.get(HoaDon.class, idHD);
            System.out.println(sanpham);
            sp = (SanPham) session.get(SanPham.class, sanpham);
            ct = new ChitiethoadonId(idHD, sanpham);
            cthd = new Chitiethoadon(null, null, null, sl);
            cthd.setId(ct);
            cthd.setHoaDon(hd);
            cthd.setSanPham(sp);
            //cthd.setSoLuong(sl[j]);
            session.save(cthd);
            transaction.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
            transaction.rollback();
        } finally {
            session.close();
        }
    }
    
   
}
