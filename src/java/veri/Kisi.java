/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veri;

/**
 *
 * @author maytemur
 */
public class Kisi {

    String isim;
    String sifre;

    public String getSifre() {
        return sifre;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    public Kisi() { //constructor
        System.out.println("kisi objesi olusturuldu");
    }

    public boolean sifreKontrol() {
        DBKatmani dbk = new DBKatmani();
        return dbk.kullaniciKontrol(isim, sifre);
    }

    public String getIsim() {
        return isim;
    }

    public void setIsim(String isim) {
        this.isim = isim;
    }

    public static void main(String[] args) {
        Kisi k = new Kisi();
        k.setIsim("kkojhy");
        k.setSifre("7889");
        System.out.println(k.sifreKontrol());
    }
}
