package com.gd.test.web.test.service;

import java.util.HashMap;
import java.util.List;

public interface ITestService2 {

	int idCheck(HashMap<String, String> params) throws Throwable;

	void insertBM(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable;

	int getBCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable;

	void insertB(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBdata(HashMap<String, String> params) throws Throwable;

	void updateBhit(HashMap<String, String> params) throws Throwable;

	void deleteB(HashMap<String, String> params) throws Throwable;

	void updateB(HashMap<String, String> params) throws Throwable;

}
