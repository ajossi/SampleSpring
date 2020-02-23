package com.gd.test.web.blog.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.blog.dao.IBlogDao;

@Service
public class BlogService implements IBlogService{
	@Autowired
	public IBlogDao iBlogDao;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iBlogDao.idCheck(params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertBM(params);
	}

	@Override
	public int nmCheck(HashMap<String, String> params) throws Throwable {
		return iBlogDao.nmCheck(params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBM(params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getB(params);
	}

	@Override
	public void insertCate(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertCate(params);
		
	}

	@Override
	public List<HashMap<String, String>> getCate(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCate(params);
	}

	@Override
	public void insertB(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertB(params);
	}

	@Override
	public void updateBhit(HashMap<String, String> params) throws Throwable {
		iBlogDao.updateBhit(params);
	}

	@Override
	public HashMap<String, String> getBdata(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBdata(params);
	}

	@Override
	public String getLData(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getLData(params);
	}

	@Override
	public void insertComment(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertComment(params);
	}

	@Override
	public int getCommentCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCommentCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getComment(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getComment(params);
	}

	@Override
	public void bUpdateData(HashMap<String, String> params) throws Throwable {
		iBlogDao.bUpdateData(params);
	}

	@Override
	public List<HashMap<String, String>> getArchive(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getArchive(params);
	}

	@Override
	public void deleteBdata(HashMap<String, String> params) throws Throwable {
		iBlogDao.deleteBdata(params);
	}

	@Override
	public List<HashMap<String, String>> getPopularB(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getPopularB(params);
	}

	@Override
	public HashMap<String, String> getBlogInfo(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlogInfo(params);
	}

}
