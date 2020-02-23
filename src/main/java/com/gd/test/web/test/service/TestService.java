package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.ITestDao;

@Service
public class TestService implements ITestService{
	@Autowired
	public ITestDao iTestDao;

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return iTestDao.getList(params);
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return iTestDao.getListCnt(params);
	}

	@Override
	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable {
		
		return iTestDao.getData(params);
	}

	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
		iTestDao.updateHit(params);
	}

	@Override
	public void insertData(HashMap<String, String> params) throws Throwable {
		iTestDao.insertData(params);
	}

	@Override
	public void updateData(HashMap<String, String> params) throws Throwable {
		iTestDao.updateData(params);
	}

	@Override
	public void deleteData(HashMap<String, String> params) throws Throwable {
		iTestDao.deleteData(params);
	}

	@Override
	public void joinData(HashMap<String, String> params) throws Throwable {
		iTestDao.joinData(params);
	}

	@Override
	public HashMap<String, String> idCheckData(HashMap<String, String> params) throws Throwable {
		iTestDao.idCheckData(params);
		return params;
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {	
		return iTestDao.getMem(params);
	}

	@Override
	public void bJoinData(HashMap<String, String> params) throws Throwable {
		iTestDao.bJoinData(params);
	}

	@Override
	public int bCheckedId(HashMap<String, String> params) throws Throwable {
		return iTestDao.bCheckedId(params);
	}

	@Override
	public HashMap<String, String> bGetMem(HashMap<String, String> params) throws Throwable {
		return iTestDao.bGetMem(params);
	}

	@Override
	public List<HashMap<String, String>> bGetList(HashMap<String, String> params) throws Throwable {
		return iTestDao.bGetList(params);
	}

	@Override
	public void bInsertData(HashMap<String, String> params) throws Throwable {
		iTestDao.bInsertData(params);
	}

	@Override
	public HashMap<String, String> bGetData(HashMap<String, String> params) throws Throwable {
		return iTestDao.bGetData(params);
	}

	@Override
	public void bUpdateHit(HashMap<String, String> params) throws Throwable {
		iTestDao.bUpdateHit(params);
	}

	@Override
	public void bDeleteData(HashMap<String, String> params) throws Throwable {
		iTestDao.bDeleteData(params);
	}

	@Override
	public void bUpdateData(HashMap<String, String> params) throws Throwable {
		iTestDao.bUpdateData(params);
	}

	@Override
	public HashMap<String, String> bmGetData(HashMap<String, String> params) throws Throwable {
		return iTestDao.bmGetData(params);
	}

	@Override
	public void bmUpdateData(HashMap<String, String> params) throws Throwable {
		iTestDao.bmUpdateData(params);
	}

	@Override
	public int bGetListCnt(HashMap<String, String> params) throws Throwable {
		return iTestDao.bGetListCnt(params);
	} 
}
