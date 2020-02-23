package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao2 implements ITestDao2 {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.idCheck", params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test2.insertBM", params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getBM", params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getBCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("test2.getB", params);
	}

	@Override
	public void insertB(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test2.insertB", params);
	}

	@Override
	public HashMap<String, String> getBdata(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test2.getBdata", params);
	}

	@Override
	public void updateBhit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.updateBhit", params);
	}

	@Override
	public void deleteB(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("test2.deleteB", params);
	}

	@Override
	public void updateB(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test2.updateB", params);
	}
}
