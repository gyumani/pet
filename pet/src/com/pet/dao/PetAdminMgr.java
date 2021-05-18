package com.pet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.pet.dbcp.DBConnectionMgr;
import com.pet.vo.*;


public class PetAdminMgr {
	
	private DBConnectionMgr pool;

	public PetAdminMgr() {
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {e.printStackTrace();}
	}
	
	//회원정보 가져오기
	public Vector<PetMemberBean> getMemberList(String keyField, String keyWord){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		Vector<PetMemberBean> vlist=new Vector<PetMemberBean>();
		try {
			con=pool.getConnection();
		
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql="select * from pet_member";
				pstmt=con.prepareStatement(sql);
			}else {
				sql = "select * from pet_member where " + keyField + " like ? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				PetMemberBean bean=new PetMemberBean();
				bean.setUserId(rs.getString("userId"));
				bean.setUserPwd(rs.getString("userPwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setBirth(rs.getString("birth"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddr(rs.getString("addr"));
				bean.setEmail(rs.getString("email"));
				bean.setMobile1(rs.getString("mobile1"));
				bean.setMobile2(rs.getString("mobile2"));
				bean.setFindPwdQuest(rs.getString("findPwdQuest"));
				bean.setFindPwdAnswer(rs.getString("findPwdAnswer"));
				String dogSizes[]=new String[3];
				String dogSize=rs.getString("dogSize");
				for (int i=0; i<dogSizes.length; i++) {
					dogSizes[i]=dogSize.substring(i,i+1);
				}
				bean.setDogSize(dogSizes);
				bean.setOwnCar(rs.getString("ownCar"));
				String wantPackages [] =new String[3];
				String wantPackage=rs.getString("wantPackage");
				for(int i=0; i<wantPackages.length; i++) {
					wantPackages[i]=wantPackage.substring(i,i+1);
				}
				bean.setWantPackage(wantPackages);
				vlist.add(bean);
			}
		}catch(Exception e) {e.printStackTrace();} finally {pool.freeConnection(con, pstmt, rs); }
		return vlist;
	}
}
