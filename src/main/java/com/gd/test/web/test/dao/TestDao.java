package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao implements ITestDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) {
		// seletList(쿼리위치) : List형태의 조회
		// seletList(쿼리위치, 값) : List형태의 조회, 값을 쿼리에 넘겨줌.
		// 쿼리위치 : namespace.id(클래스.메소드와 동일)
		return sqlSession.selectList("test.getList", params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.getListCnt", params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectOne("test.getData", params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.updateHit", params);
	}

	@Override
	public void insertData(HashMap<String, String> params) {
		sqlSession.insert("test.insertData", params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.updateData", params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("test.deleteData", params);
	}

	@Override
	public void joinData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("test.joinData", params);
	}

	@Override
	public void idCheckData(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("test.idCheckData", params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {	
		return sqlSession.selectOne("test.getMem", params);
	}

	@Override
	public void bJoinData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test.bJoinData", params);
	}

	@Override
	public int bCheckedId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.bCheckedId", params);
	}

	@Override
	public HashMap<String, String> bGetMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.bGetMem", params);
	}

	@Override
	public List<HashMap<String, String>> bGetList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("test.bGetList", params);
	}

	@Override
	public void bInsertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("test.bInsertData", params);
	}

	@Override
	public HashMap<String, String> bGetData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.bGetData", params);
	}

	@Override
	public void bUpdateHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.bUpdateHit", params);
	}

	@Override
	public void bDeleteData(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("test.bDeleteData", params);
	}

	@Override
	public void bUpdateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.bUpdateData", params);
	}

	@Override
	public HashMap<String, String> bmGetData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.bmGetData", params);
	}

	@Override
	public void bmUpdateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("test.bmUpdateData", params);
	}

	@Override
	public int bGetListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("test.bGetListCnt", params);
	}
}
