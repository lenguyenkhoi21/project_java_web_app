package Model;
// Generated Jul 15, 2020 9:40:27 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * NguonCap generated by hbm2java
 */
@Entity
@Table(name="NguonCap"
    ,schema="dbo"
    ,catalog="ShopHoaThachKimTest"
    , uniqueConstraints = @UniqueConstraint(columnNames="NguonCapPhone") 
)
public class NguonCap  implements java.io.Serializable {


     private String nguoncapId;
     private String nguoncapName;
     private String nguonCapAddress;
     private String nguonCapPhone;
     private Set<SanPham> sanPhams = new HashSet<SanPham>(0);

    public NguonCap() {
    }

    public NguonCap(String nguoncapId, String nguoncapName, String nguonCapAddress, String nguonCapPhone) {
        this.nguoncapId = nguoncapId;
        this.nguoncapName = nguoncapName;
        this.nguonCapAddress = nguonCapAddress;
        this.nguonCapPhone = nguonCapPhone;
    }
    
    public NguonCap(String nguoncapId) {
        this.nguoncapId = nguoncapId;
    }
    public NguonCap(String nguoncapId, String nguoncapName, String nguonCapAddress, String nguonCapPhone, Set<SanPham> sanPhams) {
       this.nguoncapId = nguoncapId;
       this.nguoncapName = nguoncapName;
       this.nguonCapAddress = nguonCapAddress;
       this.nguonCapPhone = nguonCapPhone;
       this.sanPhams = sanPhams;
    }
   
     @Id 

    
    @Column(name="NguoncapID", unique=true, nullable=false)
    public String getNguoncapId() {
        return this.nguoncapId;
    }
    
    public void setNguoncapId(String nguoncapId) {
        this.nguoncapId = nguoncapId;
    }

    
    @Column(name="NguoncapName")
    public String getNguoncapName() {
        return this.nguoncapName;
    }
    
    public void setNguoncapName(String nguoncapName) {
        this.nguoncapName = nguoncapName;
    }

    
    @Column(name="NguonCapAddress")
    public String getNguonCapAddress() {
        return this.nguonCapAddress;
    }
    
    public void setNguonCapAddress(String nguonCapAddress) {
        this.nguonCapAddress = nguonCapAddress;
    }

    
    @Column(name="NguonCapPhone", unique=true)
    public String getNguonCapPhone() {
        return this.nguonCapPhone;
    }
    
    public void setNguonCapPhone(String nguonCapPhone) {
        this.nguonCapPhone = nguonCapPhone;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="nguonCap")
    public Set<SanPham> getSanPhams() {
        return this.sanPhams;
    }
    
    public void setSanPhams(Set<SanPham> sanPhams) {
        this.sanPhams = sanPhams;
    }




}


