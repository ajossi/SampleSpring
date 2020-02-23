package com.gd.test.web.test.service;

import java.util.*;

public interface ITestService {

	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable;

	public int getListCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getData(HashMap<String, String> params) throws Throwable;

	public void updateHit(HashMap<String, String> params) throws Throwable;

	public void insertData(HashMap<String, String> params) throws Throwable;

	public void updateData(HashMap<String, String> params) throws Throwable;

	public void deleteData(HashMap<String, String> params) throws Throwable;

	public void joinData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> idCheckData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;

	public void bJoinData(HashMap<String, String> params) throws Throwable;

	public int bCheckedId(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> bGetMem(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> bGetList(HashMap<String, String> params) throws Throwable;

	public void bInsertData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> bGetData(HashMap<String, String> params) throws Throwable;

	public void bUpdateHit(HashMap<String, String> params) throws Throwable;

	public void bDeleteData(HashMap<String, String> params) throws Throwable;

	public void bUpdateData(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> bmGetData(HashMap<String, String> params) throws Throwable;

	public void bmUpdateData(HashMap<String, String> params) throws Throwable;

	public int bGetListCnt(HashMap<String, String> params) throws Throwable;
}
