package com.project.rural.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.project.rural.DBUtil;

public class ChartDAO {

	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public ChartDAO() {
		
		try {
			conn = DBUtil.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ChartDTO> list1() {
		
		try {
			
			String sql = String.format("select * from vwList");
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
			
			while ( rs.next() ) {
				
				ChartDTO dto = new ChartDTO();
				
				dto.setName(rs.getString("name"));
				dto.setCnt(rs.getString("total"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ChartDTO list2() {
		
		try {
			
			String sql = String.format("select * from vwCategoryTotal");
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ChartDTO dto = new ChartDTO();
			
			if ( rs.next() ) {
				
				
				dto.setCommunity(rs.getString("community"));
				dto.setNotice(rs.getString("notice"));
				dto.setWorker(rs.getString("worker"));
				dto.setExp(rs.getString("exp"));
				dto.setMarket(rs.getString("market"));
				dto.setFarm(rs.getString("farm"));
				
			}
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


}
