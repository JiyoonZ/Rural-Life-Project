package com.project.rural.worker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.project.rural.DBUtil;

public class WorkerDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public WorkerDAO() {

		try {
			conn = DBUtil.open();

		} catch (Exception e) {

			System.out.println("WorkerDAO.WorkerDAO()");
			e.printStackTrace();
		}

	}

	public ArrayList<WorkerDTO> list(HashMap<String, String> map) {

		try {

			String where = "";

			if (map.get("isSearch").equals("y")) {
				// 검색
				where = "where ";
			}
			/// if map.get("종류") == null { where += " * ";}
			// if ( (String sido = map.get("sido") ) != null)

			if (map.get("sido") != null && !map.get("sido").equals("")) {
				where += String.format("city like '%%%s%%' and ", map.get("sido"));
			}

			if (map.get("gugun") != null && !map.get("gugun").equals("")) {
				where += String.format("gu like '%%%s%%' and ", map.get("gugun"));
			}

			if (map.get("cropInfo") != null && !map.get("cropInfo").equals("")) {
				where += String.format("cropInfo like '%%%s%%' and ", map.get("cropInfo"));
			}

			if (map.get("possible") != null && !map.get("possible").equals("")) {
				where += String.format("isEnd = 'n' and ", map.get("possible"));
			}

			if (map.get("pay") != null && !map.get("pay").equals("")) {
				where += String.format("pay >= %s", map.get("pay"));
			}

			if (where.endsWith("and ")) {
				where = where.substring(0, where.length() - 4);
			}

			String sql = String.format(
					"select * from (select b.*, rownum as rnum  from vwWorker b %s) a where rnum between %s and %s order by seq desc",
					where, map.get("begin"), map.get("end"));
			

			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();

			ArrayList<WorkerDTO> list = new ArrayList<WorkerDTO>();

			while (rs.next()) {

				WorkerDTO dto = new WorkerDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setCity(rs.getString("city"));
				dto.setGu(rs.getString("gu"));
				dto.setAddress(rs.getString("address"));
				dto.setCropInfo(rs.getString("cropInfo"));
				dto.setTotalPerson(rs.getString("totalPerson"));
				dto.setPay(rs.getString("pay"));
				dto.setMinAge(rs.getString("minAge"));
				dto.setMaxAge(rs.getString("maxAge"));
				dto.setTel(rs.getString("tel"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDetail(rs.getString("detail"));
				dto.setIsCareer(rs.getString("isCareer"));
				dto.setIsEnd(rs.getString("isEnd"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));

				list.add(dto);
			}

			return list;

		} catch (Exception e) {
			System.out.println("WorkerDAO.list()");
			e.printStackTrace();
		}

		return null;
	}

	public WorkerDTO get(String seq) {

		try {
			String sql = "select w.*, (select name from tblUser where id = w.id) as name from tblWorker w where seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				WorkerDTO dto = new WorkerDTO();

				dto.setId(rs.getString("id"));
				dto.setSeq(rs.getString("seq"));
				dto.setCity(rs.getString("city"));
				dto.setGu(rs.getString("gu"));
				dto.setAddress(rs.getString("address"));
				dto.setCropInfo(rs.getString("cropInfo"));
				dto.setTotalPerson(rs.getString("totalPerson"));
				dto.setPay(rs.getString("pay"));
				dto.setMinAge(rs.getString("minAge"));
				dto.setMaxAge(rs.getString("maxAge"));
				dto.setTel(rs.getString("tel"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDetail(rs.getString("detail"));
				dto.setIsCareer(rs.getString("isCareer"));
				dto.setIsEnd(rs.getString("isEnd"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));

				return dto;

			}

		} catch (Exception e) {

			System.out.println("WorkerDTO.get()");
			e.printStackTrace();
		}

		return null;
	}

	// 등록내역
	public ArrayList<WorkerDTO> addList(HashMap<String, String> map) {

		try {

			String sql = String.format("select * from (select b.*, rownum as rnum  from vwWorker b where id=?) a where rnum between %s and %s order by seq desc"
							, map.get("begin"), map.get("end"));
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("id"));
			rs = pstat.executeQuery();

			ArrayList<WorkerDTO> list = new ArrayList<WorkerDTO>();

			while (rs.next()) {

				WorkerDTO dto = new WorkerDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setCity(rs.getString("city"));
				dto.setGu(rs.getString("gu"));
				dto.setAddress(rs.getString("address"));
				dto.setCropInfo(rs.getString("cropInfo"));
				dto.setTotalPerson(rs.getString("totalPerson"));
				dto.setPay(rs.getString("pay"));
				dto.setMinAge(rs.getString("minAge"));
				dto.setMaxAge(rs.getString("maxAge"));
				dto.setTel(rs.getString("tel"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDetail(rs.getString("detail"));
				dto.setIsCareer(rs.getString("isCareer"));
				dto.setIsEnd(rs.getString("isEnd"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));

				list.add(dto);
			}
			;

			return list;

		} catch (Exception e) {

			System.out.println("WorkerDTO.addList()");
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<WorkerDTO> date() {
		try {
			String sql = "select w.*, (select name from tblUser where id = w.id) as name from tblWorker w";

			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();

			ArrayList<WorkerDTO> list = new ArrayList<WorkerDTO>();

			if (rs.next()) {

				WorkerDTO dto = new WorkerDTO();

				dto.setId(rs.getString("id"));
				dto.setCity(rs.getString("city"));
				dto.setGu(rs.getString("gu"));
				dto.setAddress(rs.getString("address"));
				dto.setCropInfo(rs.getString("cropInfo"));
				dto.setTotalPerson(rs.getString("totalPerson"));
				dto.setPay(rs.getString("pay"));
				dto.setMinAge(rs.getString("minAge"));
				dto.setMaxAge(rs.getString("maxAge"));
				dto.setTel(rs.getString("tel"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDetail(rs.getString("detail"));
				dto.setIsCareer(rs.getString("isCareer"));
				dto.setIsEnd(rs.getString("isEnd"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));

				list.add(dto);

			}

			return list;

		} catch (Exception e) {

			System.out.println("WorkerDTO.get()");
			e.printStackTrace();
		}

		return null;
	}

	public int add(WorkerDTO dto) {
		try {
			String sql = "insert into tblWorker (seq, id, city, gu, address, cropInfo, totalPerson, pay, minAge, maxAge, tel, startDate, endDate, regDate, detail, isCareer, isEnd, title) values (seqWorker.nextVal, ?,?,?,?,?,?,?,?,?,?,?,?,default,?,?,default,?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getCity());
			pstat.setString(3, dto.getGu());
			pstat.setString(4, dto.getAddress());
			pstat.setString(5, dto.getCropInfo());
			pstat.setString(6, dto.getTotalPerson());
			pstat.setString(7, dto.getPay());
			pstat.setString(8, dto.getMinAge());
			pstat.setString(9, dto.getMaxAge());
			pstat.setString(10, dto.getTel());
			pstat.setString(11, dto.getStartDate());
			pstat.setString(12, dto.getEndDate());
			pstat.setString(13, dto.getDetail());

			if (dto.getIsCareer() == "on") {
				pstat.setString(14, "y");
			} else {
				pstat.setString(14, "n");
			}

			pstat.setString(15, dto.getTitle());

			return pstat.executeUpdate();

		} catch (Exception e) {

			System.out.println("WorkerDTO.add()");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<WorkerDTO> applyList(String id) {

		try {

			String sql = "select * from tblworkapply a inner join tblWorker w on w.seq = a.pseq inner join tblUser u on u.id = w.id where a.id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			ArrayList<WorkerDTO> list = new ArrayList<WorkerDTO>();

			while (rs.next()) {

				WorkerDTO dto = new WorkerDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setCity(rs.getString("city"));
				dto.setGu(rs.getString("gu"));
				dto.setTitle(rs.getString("title"));
				dto.setTel(rs.getString("tel"));
				dto.setIsPass(rs.getString("isPass"));
				dto.setPseq(rs.getString("pseq"));

				list.add(dto);
			};

			return list;

		} catch (Exception e) {

			System.out.println("WorkerDAO.applyList()");

			e.printStackTrace();
		}

		return null;
	}

	public int del(String seq) {

		try {

			String sql = "delete from tblWorker where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("WorkerDAO.del()");

			e.printStackTrace();
		}

		return 0;
	}


	public WorkerDTO edit(String seq) {

		try {
			String sql = "select w.*, (select name from tblUser where id = w.id) as name from tblWorker w where seq=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				WorkerDTO dto = new WorkerDTO();

				dto.setId(rs.getString("id"));
				dto.setCity(rs.getString("city"));
				dto.setGu(rs.getString("gu"));
				dto.setAddress(rs.getString("address"));
				dto.setCropInfo(rs.getString("cropInfo"));
				dto.setTotalPerson(rs.getString("totalPerson"));
				dto.setPay(rs.getString("pay"));
				dto.setMinAge(rs.getString("minAge"));
				dto.setMaxAge(rs.getString("maxAge"));
				dto.setTel(rs.getString("tel"));
				dto.setStartDate(rs.getString("startDate"));
				dto.setEndDate(rs.getString("endDate"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setDetail(rs.getString("detail"));
				dto.setIsCareer(rs.getString("isCareer"));
				
				dto.setIsEnd(rs.getString("isEnd"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setSeq(rs.getString("seq"));

				return dto;

			}

		} catch (Exception e) {

			System.out.println("WorkerDTO.get()");
			e.printStackTrace();
		}

		return null;
	}

	
	
	public int editok(WorkerDTO dto) {
		try {

			String sql = "update tblWorker set title = ?, isEnd = ?, tel = ?, startDate = ?, endDate = ?, city = ?, gu = ?, isCareer = ?, totalPerson = ?, minAge = ?, maxAge = ?, cropInfo = ?, pay = ?, address = ?, detail = ? where seq = ?";			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getIsEnd());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getStartDate());
			pstat.setString(5, dto.getEndDate());
			pstat.setString(6, dto.getCity());
			pstat.setString(7, dto.getGu());
			pstat.setString(8, dto.getIsCareer());
			pstat.setString(9, dto.getTotalPerson());
			pstat.setString(10, dto.getMinAge());
			pstat.setString(11, dto.getMaxAge());
			pstat.setString(12, dto.getCropInfo());
			pstat.setString(13, dto.getPay());
			pstat.setString(14, dto.getAddress());
			pstat.setString(15, dto.getDetail());
			pstat.setString(16, dto.getSeq());
			
			return pstat.executeUpdate();			

		} catch (Exception e) {
			System.out.println("WorkerDAO.editok()");
			e.printStackTrace();
		}
		return 0;
	}

	public int getTotalCount(HashMap<String, String> map) {
		try {
			
			String where = "";

			if (map.get("isSearch").equals("y")) {
				// 검색
				where = "where ";
			}
			/// if map.get("종류") == null { where += " * ";}
			// if ( (String sido = map.get("sido") ) != null)

			if (map.get("sido") != null && !map.get("sido").equals("")) {
				where += String.format("city like '%%%s%%' and ", map.get("sido"));
			}

			if (map.get("gugun") != null && !map.get("gugun").equals("")) {
				where += String.format("gu like '%%%s%%' and ", map.get("gugun"));
			}

			if (map.get("cropInfo") != null && !map.get("cropInfo").equals("")) {
				where += String.format("cropInfo like '%%%s%%' and ", map.get("cropInfo"));
			}

			if (map.get("possible") != null && !map.get("possible").equals("")) {
				where += String.format("isEnd = 'n' and ", map.get("possible"));
			}

			if (map.get("pay") != null && !map.get("pay").equals("")) {
				where += String.format("pay >= %s", map.get("pay"));
			}

			if (where.endsWith("and ")) {
				where = where.substring(0, where.length() - 4);
			}

			String sql = String.format(
					"select count(*) as cnt from tblWorker where 1=1 %s order by seq desc",
					where);
			
			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("WorkerDAO.getTotalCount()");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	
	public int addListTotalCount(HashMap<String, String> map) {
		
		try {
			
			String sql = String.format("select count(*) as cnt from tblWorker where id='%s'", map.get("id"));
			
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("WorkerDAO.addListTotalCount()");
			e.printStackTrace();
		}
		
		return 0;
	}

}
