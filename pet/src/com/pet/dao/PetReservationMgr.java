package com.pet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pet.dbcp.DBConnectionMgr;
import com.pet.vo.PetReservationBean;

public class PetReservationMgr {
	
	private DBConnectionMgr pool;
	
	public PetReservationMgr() {
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {e.printStackTrace();}
	}
	
	//예약 하기
	public boolean insertReservation(PetReservationBean bean) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="insert pet_reservation(userId, name, point_addr, pickUp, dateStart, dateEnd, withPackage, dogSize,memo)"+"values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPoint_addr());
			pstmt.setString(4, bean.getPickUp());
			pstmt.setString(5, bean.getDateStart());
			pstmt.setString(6, bean.getDateEnd());
			pstmt.setString(7, bean.getWithPackage());
			String dogSize []=bean.getDogSize();
			char ds []= {'0','0','0'};
			String lists []= {"소형견","중형견","대형견"};
			for (int i=0; i<dogSize.length; i++) {
				for(int j=0; j<lists.length;j++) {
					if(dogSize[i].equals(lists[j]))
						ds[j]='1';
				}
			}
			pstmt.setString(8,new String(ds));
			pstmt.setString(9, bean.getMemo());
			if(pstmt.executeUpdate()==1) flag=true;
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt);}
		return flag;
	}
	
	//예약정보 불러오기
	public PetReservationBean getReservation(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		PetReservationBean bean=null;
		try {
			con=pool.getConnection();
			sql="select * from pet_reservation where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean=new PetReservationBean();
				bean.setUserId(rs.getString("userId"));
				bean.setName(rs.getString("name"));
				bean.setPoint_addr(rs.getString("point_addr"));
				bean.setPickUp(rs.getString("pickUp"));
				bean.setDateStart(rs.getString("dateStart"));
				bean.setDateEnd(rs.getString("dateEnd"));
				bean.setWithPackage(rs.getString("withPackage"));
				String dogSizes[]=new String[3];
				String dogSize=rs.getString("dogSize");
				for (int i=0; i<dogSizes.length; i++) {
					dogSizes[i]=dogSize.substring(i,i+1);
				}
				bean.setDogSize(dogSizes);
				bean.setMemo(rs.getString("memo"));
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt, rs);}
		return bean;
	}
	
	//예약정보 수정
	public boolean updateReservation(PetReservationBean bean) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="update pet_reservation set name=?, point_addr=?, pickup=?, dateStart=?, dateEnd=?, withPackage=?, dogSize=?, memo=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getPoint_addr());
			pstmt.setString(3, bean.getPickUp());
			pstmt.setString(4, bean.getDateStart());
			pstmt.setString(5, bean.getDateEnd());
			pstmt.setString(6, bean.getWithPackage());
			String dogSize []=bean.getDogSize();
			char ds []= {'0','0','0'};
			String lists []= {"소형견","중형견","대형견"};
			for (int i=0; i<dogSize.length; i++) {
				for(int j=0; j<lists.length;j++) {
					if(dogSize[i].equals(lists[j]))
						ds[j]='1';
				}
			}
			pstmt.setString(7,new String(ds));
			pstmt.setString(8, bean.getMemo());
			int count=pstmt.executeUpdate();
			if(count>0)
				flag=true;
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt);}
		return flag;
	}
	
	//예약정보삭제
	
	public boolean deleteReservation(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="delete from pet_reservation where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			int count=pstmt.executeUpdate();
			if(0<count){
				flag=true;
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt);}
		
		return flag;
	}
	
	//예약정보 확인여부 불러오기
	
	public boolean checkReservation(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="select * from pet_reservation where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt, rs); }
		return flag;
	}

}
