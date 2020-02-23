package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.test.dao.ITestDao2;

@Service
public class TestService2 implements ITestService2 {
	@Autowired
	public ITestDao2 iTestDao2;

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iTestDao2.idCheck(params);
	}

	@Override
	public void insertBM(HashMap<String, String> params) throws Throwable {
		iTestDao2.insertBM(params);
	}

	@Override
	public HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getBM(params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getBCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getB(params);
	}

	@Override
	public void insertB(HashMap<String, String> params) throws Throwable {
		iTestDao2.insertB(params);
	}

	@Override
	public HashMap<String, String> getBdata(HashMap<String, String> params) throws Throwable {
		return iTestDao2.getBdata(params);
	}

	@Override
	public void updateBhit(HashMap<String, String> params) throws Throwable {
		iTestDao2.updateBhit(params);
	}

	@Override
	public void deleteB(HashMap<String, String> params) throws Throwable {
		iTestDao2.deleteB(params);
	}

	@Override
	public void updateB(HashMap<String, String> params) throws Throwable {
		iTestDao2.updateB(params);
	}
}
