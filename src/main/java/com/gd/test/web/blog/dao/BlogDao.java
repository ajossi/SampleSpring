package com.gd.test.web.blog.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDao implements IBlogDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.idCheck", params);
	}

	@Override
	public int nmCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.nmCheck", params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertBM", params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBM", params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getB", params);
	}

	@Override
	public void insertCate(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertCate", params);
	}

	@Override
	public List<HashMap<String, String>> getCate(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getCate", params);
	}

	@Override
	public void insertB(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertB", params);
	}

	@Override
	public void updateBhit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.updateBhit", params);
	}

	@Override
	public HashMap<String, String> getBdata(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBdata", params);
	}

	@Override
	public String getLData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getLData", params);
	}

	@Override
	public void insertComment(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertComment", params);
	}

	@Override
	public int getCommentCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getCommentCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getComment(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getComment", params);
	}

	@Override
	public void bUpdateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.bUpdateData", params);
	}

	@Override
	public List<HashMap<String, String>> getArchive(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("getArchive", params);
	}

	@Override
	public void deleteBdata(HashMap<String, String> params) throws Throwable {
		sqlSession.update("deleteBdata", params);
	}

	@Override
	public List<HashMap<String, String>> getPopularB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("getPopularB", params);
	}

	@Override
	public HashMap<String, String> getBlogInfo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("getBlogInfo", params);
	}
}
