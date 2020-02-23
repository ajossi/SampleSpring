package com.gd.test.web.test.dao;

import java.util.HashMap;
import java.util.List;

public interface ITestDao {

	List<HashMap<String, String>> getList(HashMap<String,String> params);

	int getListCnt(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;
	
	void updateHit(HashMap<String, String> params) throws Throwable;

	void insertData(HashMap<String, String> params) throws Throwable;

	void updateData(HashMap<String, String> params) throws Throwable;

	void deleteData(HashMap<String, String> params) throws Throwable;

	void joinData(HashMap<String, String> params) throws Throwable;

	void idCheckData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;

	void bJoinData(HashMap<String, String> params) throws Throwable;

	int bCheckedId(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> bGetMem(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> bGetList(HashMap<String, String> params) throws Throwable;

	void bInsertData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> bGetData(HashMap<String, String> params) throws Throwable;

	void bUpdateHit(HashMap<String, String> params) throws Throwable;

	void bDeleteData(HashMap<String, String> params) throws Throwable;

	void bUpdateData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> bmGetData(HashMap<String, String> params) throws Throwable;

	void bmUpdateData(HashMap<String, String> params) throws Throwable;

	int bGetListCnt(HashMap<String, String> params) throws Throwable;
}
