--Tao view quan ly thong tin de an
create view v_ThongTinDuAn as
select da.MADA, da.TENDA, da.KINHPHI, pb.TENPHONG as PHONGCHUTRI, cn.TENCN as TENCHINHANHCHUTRI, nv.HOTEN as TRUONGDUAN, sum(ct.SOTIEN) as TONGCHI
FROM DUAN da join PHONGBAN pb on (da.PHONGCHUTRI = pb.MAPHONG) join CHINHANH cn on (pb.CHINHANH = cn.MACN)
	 join NHANVIEN nv on (da.TRUONGDA = nv.MANV) left join CHITIEU ct on (ct.DUAN = da.MADA)
GROUP BY CT.DUAN, da.MADA, da.TENDA, da.KINHPHI, pb.TENPHONG,  cn.TENCN, nv.HOTEN
ORDER BY da.MADA asc;

--Gan quyen select tren view quan ly thong tin de an cho Giam Doc
grant select on v_ThongTinDuAn to r_GiamDoc;