package com.pet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.pet.dbcp.DBConnectionMgr;
import com.pet.vo.PetMemberBean;
import com.pet.vo.ZipcodeBean;

public class PetMemberMgr {
	
	private DBConnectionMgr pool;
	
	public PetMemberMgr() {
		try {
			pool=DBConnectionMgr.getInstance();
		}catch(Exception e) {e.printStackTrace(); }
	}
	
	//ID 중복확인
	public boolean checkId(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="select userId from pet_member where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		}
		catch(Exception e) {e.printStackTrace(); }
		finally {pool.freeConnection(con, pstmt, rs); }
		return flag;
	}
	
	//우편번호 검색
	public Vector<ZipcodeBean> zipcodeRead(String area3){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		Vector<ZipcodeBean> vlist=new Vector<ZipcodeBean>();
		try {
			con=pool.getConnection();
			sql="select * from petZipcode where area3 like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+area3+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean=new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				bean.setArea4(rs.getString(5));
				vlist.add(bean);
			}
		}
		catch(Exception e) {e.printStackTrace(); }
		finally {pool.freeConnection(con, pstmt, rs);}
		return vlist;
	}
	
	//회원가입
	public boolean insertMember(PetMemberBean bean) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="insert pet_member(userId, userPwd, name, gender,birth, zipcode, addr, email, mobile1, mobile2, findPwdQuest, findPwdAnswer, dogSize, ownCar, wantPackage)"+"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserId());
			pstmt.setString(2,bean.getUserPwd());
			pstmt.setString(3,bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirth());
			pstmt.setString(6,bean.getZipcode());
			pstmt.setString(7,bean.getAddr());
			pstmt.setString(8,bean.getEmail());
			pstmt.setString(9,bean.getMobile1());
			pstmt.setString(10,bean.getMobile2());
			pstmt.setString(11,bean.getFindPwdQuest());
			pstmt.setString(12,bean.getFindPwdAnswer());
			String dogSize []=bean.getDogSize();
			char ds []= {'0','0','0'};
			String lists []= {"소형견","중형견","대형견"};
			for (int i=0; i<dogSize.length; i++) {
				for(int j=0; j<lists.length;j++) {
					if(dogSize[i].equals(lists[j]))
						ds[j]='1';
				}
			}
			pstmt.setString(13,new String(ds));
			pstmt.setString(14,bean.getOwnCar());
			String wantPackage []=bean.getWantPackage();
			char wp []= {'0','0','0'};
			String listsWp [] = {"trecking","waterpool","rest"};
			for(int i=0; i<wantPackage.length; i++) {
				for(int j=0; j<listsWp.length; j++) {
					if(wantPackage[i].equals(listsWp[j]))
						wp[j]=1;
				}
			}
			pstmt.setString(15,new String(wp));
			if(pstmt.executeUpdate()==1) flag=true;
			
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt);}
		return flag;
	}
	
	//로그인
	public boolean loginMember(String userId, String userPwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			sql="select userId from pet_member where userId=? and userPwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs=pstmt.executeQuery();
			flag=rs.next();
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con,pstmt, rs);}
		return flag;
	}
	
	//탈퇴
	public boolean deleteMember (String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		boolean flag=false;
		try {
			con=pool.getConnection();
			String sql="delete from pet_member where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			int count=pstmt.executeUpdate();
			if(count>0) {
				flag=true;
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return flag;
	}

	//회원정보 가져오기
	public PetMemberBean getMember(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PetMemberBean bean=null;
		try {
			con=pool.getConnection();
			String sql="select * from pet_member where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean=new PetMemberBean();
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
			}
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con);}
		return bean;
	}
	
	//회원정보수정
	public boolean updateMember(PetMemberBean bean) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql=null;
		boolean flag=false;
		
		try {
			con=pool.getConnection();
			sql="update pet_member set userPwd=?, name=?, gender=?, birth=?, zipcode=?, addr=?, email=?, mobile1=?, mobile2=?, findPwdQuest=?, findPwdAnswer=?, dogSize=?, ownCar=?, wantPackage=? where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,bean.getUserPwd());
			pstmt.setString(2,bean.getName());
			pstmt.setString(3, bean.getGender());
			pstmt.setString(4, bean.getBirth());
			pstmt.setString(5,bean.getZipcode());
			pstmt.setString(6,bean.getAddr());
			pstmt.setString(7,bean.getEmail());
			pstmt.setString(8,bean.getMobile1());
			pstmt.setString(9,bean.getMobile2());
			pstmt.setString(10,bean.getFindPwdQuest());
			pstmt.setString(11,bean.getFindPwdAnswer());
			String dogSize []=bean.getDogSize();
			char ds []= {'0','0','0'};
			String lists []= {"소형견","중형견","대형견"};
			for (int i=0; i<dogSize.length; i++) {
				for(int j=0; j<lists.length;j++) {
					if(dogSize[i].equals(lists[j]))
						ds[j]='1';
				}
			}
			pstmt.setString(12,new String(ds));
			pstmt.setString(13,bean.getOwnCar());
			String wantPackage []=bean.getWantPackage();
			char wp []= {'0','0','0'};
			String listsWp [] = {"trecking","waterpool","rest"};
			for(int i=0; i<wantPackage.length; i++) {
				for(int j=0; j<listsWp.length; j++) {
					if(wantPackage[i].equals(listsWp[j]))
						wp[j]=1;
				}
			}
			pstmt.setString(14,new String(wp));
			pstmt.setString(15, bean.getUserId());
			int count=pstmt.executeUpdate();
			if(count>0)
				flag=true;
			
		}
		catch(Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con, pstmt);}
		return flag;
	}
	//아이디 찾기
	public String findId(String name, String email) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		String userId=null;
		try {
			con=pool.getConnection();
			sql="select userId from pet_member where name=? and email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				userId=rs.getString(1);
			}
		}
		catch (Exception e) {e.printStackTrace();}
		finally {pool.freeConnection(con);}
		return userId;
	}
	
	
	
	//비밀번호 찾기
	public String findPwd(String userId,String findPwdQuest, String findPwdAnswer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		String userPwd=null;
		try {
			con=pool.getConnection();
			sql="select userPwd from pet_member where userId=? and findPwdQuest=? and findPwdAnswer=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2,findPwdQuest);
			pstmt.setString(3,findPwdAnswer);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				userPwd=rs.getString(1);
			}
		}
		catch(Exception e) {e.printStackTrace(); }
		finally {pool.freeConnection(con);}
		return userPwd;
	}
	// 회원정보 인터렉션용
	public String findMain(String userId) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=null;
		String dogSize=null;
		try {
			con=pool.getConnection();
			sql="select dogSize from pet_member where userId=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dogSize=rs.getString(1);
			}
		}
		catch(Exception e) {e.printStackTrace(); }
		finally {pool.freeConnection(con);}
		return dogSize;
		
	}
}
