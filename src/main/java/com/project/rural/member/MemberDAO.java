package com.project.rural.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.project.rural.DBUtil;
import com.project.rural.community.CommunityDTO;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemberDAO() {
		
		try {
			
			conn = DBUtil.open();
			
		} catch (Exception e) {
			System.out.println("MemberDAO.MemberDAO()");
			e.printStackTrace();
		}
		
	}

	public MemberDTO login(MemberDTO dto) {
		
		try {
			
			String sql = "select * from tblUser where id=? and pw=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				MemberDTO result = new MemberDTO();
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setBirth(rs.getString("birth"));
				result.setGender(rs.getString("gender"));
				result.setTel(rs.getString("tel"));
				result.setEmail(rs.getString("email"));
				result.setAddress(rs.getString("address"));
				result.setLv(rs.getString("lv"));
				result.setRegDate(rs.getString("regDate"));
				result.setIsOut(rs.getString("isOut"));
				result.setIsStop(rs.getString("isStop"));
				
				return result;
			}
			
		} catch (Exception e) {
			System.out.println("MemberDAO.login()");
			e.printStackTrace();
		}
		
		return null;
	}

	public int signup(MemberDTO dto) {
		
		try {
			
			String sql = "insert into tblUser (id, pw, name, birth, gender, tel, email, address, lv, regDate, isOut, isStop) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getBirth());
			pstat.setString(5, dto.getGender());
			pstat.setString(6, dto.getTel());
			pstat.setString(7, dto.getEmail());
			pstat.setString(8, dto.getAddress());
			pstat.setString(9, dto.getLv());
			
			return pstat.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public MemberDTO idFind(MemberDTO dto) {
		
		try {
			
			String sql = "select id from tblUser where name=? and email=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getEmail());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				MemberDTO result = new MemberDTO();
				result.setId(rs.getString("id"));
				
				return result;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public MemberDTO pwFind(MemberDTO dto) {
		
		try {
			
			String sql = "select * from tblUser where id=? and name=? and email=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getEmail());
			
			rs = pstat.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				
				MemberDTO result = new MemberDTO();
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setPw(rs.getString("pw"));
				
				return result;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	public void pwClear(String id, int u_pw) {
		
		try {
			
			String sql = "update tblUser set pw=? where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, u_pw);
			pstat.setString(2, id);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public MemberDTO get(String id) {
		
		try {
			
			String sql = "select * from tblUser where id=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if ( rs.next() ) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setLv(rs.getString("lv"));
				
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * MyEditOk 서블릿
	 * 
	 * @param dto
	 * @return
	 */
	public int edit(MemberDTO dto) {
		
		try {
			
			String sql = "update tblUser set gender=?, tel=?, email=?, pw=?, address=? where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getGender());
			pstat.setString(2, dto.getTel());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getPw());
			pstat.setString(5, dto.getAddress());
			pstat.setString(6, dto.getId());
			
			return pstat.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * MyEdit, MyDelOk 서블릿
	 * 
	 * @param id
	 * @param nowpw
	 * @return
	 */
	public int pwCheck(String id, String nowpw) {
		
		try {
			
			String sql = "select * from tblUser where id=? and pw=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			pstat.setString(2, nowpw);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/**
	 * MyDelOk 서블릿
	 * 
	 * @param id
	 */
	public void del(String id) {
		
		try {
			
			String sql = "update tblUser set isOut='y' where id=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public boolean checkId(String id) {
	      
	      try {
	         
	         String sql = "select * from tblUser where id=?";
	         
	         pstat = conn.prepareStatement(sql);
	         pstat.setString(1, id);
	         
	         rs = pstat.executeQuery();
	         
	         if (rs.next()) {         
	            return false;
	         } else {
	            return true;
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return false;
	}

	public ArrayList<MemberDTO> memberList(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("isSearch").equals("y")) {
				where += " where";
			}
			
			// 탈퇴, 정지, 정상 list
			if (map.get("sort") != null && !map.get("sort").equals("")) {
				if (map.get("sort").equals("전체")) {
					
				} else if (map.get("sort").equals("탈퇴")) {
					where += String.format(" isOut = 'y' and");
				} else if (map.get("sort").equals("정지")) {
					where += String.format(" isStop = 'y' and isOut = 'n' and");
				} else if (map.get("sort").equals("정상")) {
					where += String.format(" isStop = 'n' and isOut = 'n' and");
				} 
			}
			
			// 전체, 일반, 농업인 id 검색
			if (map.get("column") != null && !map.get("column").equals("") ) {
				if (map.get("column").equals("전체")) {
					where += String.format(" lv = 1 and id like '%%%s%%' or lv = 2 and id like '%%%s%%'"
							, map.get("search"), map.get("search"));
				} else if (map.get("column").equals("일반")) {
					where += String.format(" lv = 1 and id like '%%%s%%'"
							, map.get("search"));
				} else if (map.get("column").equals("농업인")) {
					where += String.format(" lv = 2 and id like '%%%s%%'"
							, map.get("search"));
				}
			}
			
			// 뒷 문장 and 제거
			if (where.endsWith("and")) {
				where = where.substring(0, where.length() - 3);
			}
			
			// where 필요없을때
			if (where.equals(" where")) {
				where = "";
			}
			
			String sql = String.format("select * from (select u.*, rownum as rnum from tblUser u %s) where rnum between %s and %s"
											, where
											, map.get("begin")
							                , map.get("end"));
			
			pstat = conn.prepareStatement(sql);
				
			rs = pstat.executeQuery();
				
			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			
			while ( rs.next() ) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setId(rs.getString("id"));
				dto.setLv(rs.getString("lv"));
				dto.setName(rs.getString("name"));
				dto.setRegDate(rs.getString("regdate"));
				dto.setIsOut(rs.getString("isout"));
				dto.setIsStop(rs.getString("isstop"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
				String where = "";
				
				if (map.get("isSearch").equals("y")) {
					where += " where";
				}
				
				// 탈퇴, 정지, 정상 list
				if (map.get("sort") != null && !map.get("sort").equals("")) {
					if (map.get("sort").equals("전체")) {
						
					} else if (map.get("sort").equals("탈퇴")) {
						where += String.format(" isOut = 'y' and");
					} else if (map.get("sort").equals("정지")) {
						where += String.format(" isStop = 'y' and isOut = 'n' and");
					} else if (map.get("sort").equals("정상")) {
						where += String.format(" isStop = 'n' and isOut = 'n' and");
					} 
				}
				
				// 전체, 일반, 농업인 id 검색
				if (map.get("column") != null && !map.get("column").equals("") ) {
					if (map.get("column").equals("전체")) {
						where += String.format(" lv = 1 and id like '%%%s%%' or lv = 2 and id like '%%%s%%'"
								, map.get("search"), map.get("search"));
					} else if (map.get("column").equals("일반")) {
						where += String.format(" lv = 1 and id like '%%%s%%'"
								, map.get("search"));
					} else if (map.get("column").equals("농업인")) {
						where += String.format(" lv = 2 and id like '%%%s%%'"
								, map.get("search"));
					}
				}
				
				// 뒷 문장 and 제거
				if (where.endsWith("and")) {
					where = where.substring(0, where.length() - 3);
				}
				
				// where 필요없을때
				if (where.equals(" where")) {
					where = "";
				}
				
				String sql = String.format("select count(*) as total from tblUser %s", where);
				
				pstat = conn.prepareStatement(sql);
				
				rs = pstat.executeQuery();
				
				if ( rs.next() ) {
					return rs.getInt("total");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int stopY(String id) {
		
		try {
			
			String sql = "update tblUser set isStop='y' where id=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}

	public int stopN(String id) {
		
		try {
			
			String sql = "update tblUser set isStop='n' where id=?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}


}
