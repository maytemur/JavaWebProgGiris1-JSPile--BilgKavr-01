/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veri;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author maytemur
 */
public class DBKatmani {

    private Connection conn;
    String dburl = "jdbc:derby://localhost:1527/bilgKavramlariJavaDb";
    String user = "maytemur";
    String pass = "9441139";

    public Connection baglan() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("baglanti basarili");
            conn = DriverManager.getConnection(dburl, user, pass);
            System.out.println(conn);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("baglantida sorun var");
            System.out.println("conn" + "  " + e.getMessage());
        }
        return conn;
    }

    public void kullaniciListesi() {
        if (conn == null) {
            System.out.println("veritabani bagli degil, baglaniyorum");
            baglan();
        }
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from kullanici");
            System.out.println("kullanici adi \t sifre \t isim \t telefon");

            while (rs.next()) {
                System.out.println("" + rs.getString(1) + " \t" + rs.getString(2) + "\t" + rs.getString(3) + " \t" + rs.getString(4));

            }

        } catch (Exception e) {
        }

    }

    public boolean kullaniciKontrol(String kullaniciAdi, String sifre) {
        if (conn == null) {
            System.out.println("veritabani bagli degil baglaniyorum-kullanici kontrol");
            baglan();
            System.out.println("kullanıcı kontrol'e bağlandan geri geldi");
        }
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from kullanici where adi='" + kullaniciAdi + "'");
            System.out.println("result setten sonraki adım");
            while (rs.next()) {
                System.out.println("kullanıcı kontrol");
                return sifre.equals(rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        DBKatmani dbk = new DBKatmani();
        dbk.kullaniciListesi();
    }
}
