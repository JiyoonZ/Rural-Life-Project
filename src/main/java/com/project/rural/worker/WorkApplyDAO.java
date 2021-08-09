package com.project.rural.worker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.project.rural.DBUtil;

public class WorkApplyDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public WorkApplyDAO() {
		
		try {
			conn = DBUtil.open();
			
		} catch (Exception e) {
			
			System.out.println("WorkerApplyDAO.WorkerApplyDAO()");
			e.printStackTrace();
		}
		
	}

	public int apply(WorkApplyDTO dto) {
		
		try {
			
			String sql = "insert into tblWorkApply (seq, pseq, id, totalApply, detail, isPass, regDate, isCareer) values"
					+ "(seqWorkApply.nextVal,?,?,?,?,default,default,?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPseq());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getTotalApply());
			pstat.setString(4, dto.getDetail());
			pstat.setString(5, dto.getIsCareer());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("WorkApplyDTO.apply()");
			e.printStackTrace();
		}

		return 0;
	}

	public int cancel(String seq) {
		
		try {
			
			String sql = "delete from tblWorkApply where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("WorkApplyDTO.cancel()");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	
	
	public ArrayList<WorkApplyDTO> applycant(String seq) {
		
		try {
			
			String sql = "select * from tblworkapply a inner join tblUser u on a.id = u.id where a.pseq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<WorkApplyDTO> list = new ArrayList<WorkApplyDTO>();
			
			while (rs.next()) {

				WorkApplyDTO dto = new WorkApplyDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				
				if(rs.getString("gender") == "m") {
					dto.setGender("남자");
				} else {
					dto.setGender("여자");
				}
				dto.setBirth(rs.getString("birth"));
				dto.setTotalApply(rs.getString("totalApply"));
				dto.setTel(rs.getString("tel")); 
				dto.setRegDate(rs.getString("regDate"));
				dto.setIsPass(rs.getString("isPass"));
				
				if(rs.getString("isCareer").equals('y')) {
					
					dto.setIsCareer("신입");
				} else {
					
					dto.setIsCareer("경력");
				}
				
				dto.setDetail(rs.getString("detail"));
				
				
				list.add(dto);
			};
			
			return list;
			
			
		}  catch (Exception e) {
			System.out.println("WorkApplyDTO.applycant()");
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	public int applycantok(WorkApplyDTO dto) {
		
		try {
			
			String sql = "update tblWorkApply set isPass = 'y' where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("WorkApplyDTO.applycantok()");
			
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	public WorkApplyDTO get(String seq) {
		
		try {
			String sql = "select * from tblworkapply a inner join tblUser u on a.id = u.id where a.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				WorkApplyDTO dto = new WorkApplyDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));
				dto.setIsCareer(rs.getString("isCareer"));
				dto.setTel(rs.getString("tel"));
				dto.setTotalApply(rs.getString("totalApply"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDetail(rs.getString("detail"));
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("WorkApplyDTO.get()");
			
			e.printStackTrace();
		}
		
		return null;
	}

	public void allApplydel(String seq) {
			try {
				
				String sql = "delete from tblWorkApply where pseq = ?";
				
				pstat = conn.prepareStatement(sql);

				pstat.setString(1, seq);

				pstat.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("WorkerDAO.allApplydel()");
				e.printStackTrace();
			}

	}

}
