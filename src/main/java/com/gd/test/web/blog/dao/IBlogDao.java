package com.gd.test.web.blog.dao;

import java.util.HashMap;
import java.util.List;

public interface IBlogDao {

	int idCheck(HashMap<String, String> params) throws Throwable;

	int nmCheck(HashMap<String, String> params) throws Throwable;

	void insertBM(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBM(HashMap<String, String> params) throws Throwable;

	int getBCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable;

	void insertCate(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getCate(HashMap<String, String> params) throws Throwable;

	void insertB(HashMap<String, String> params) throws Throwable;

	void updateBhit(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBdata(HashMap<String, String> params) throws Throwable;

	String getLData(HashMap<String, String> params) throws Throwable;

	void insertComment(HashMap<String, String> params) throws Throwable;

	int getCommentCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getComment(HashMap<String, String> params) throws Throwable;

	void bUpdateData(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getArchive(HashMap<String, String> params) throws Throwable;

	void deleteBdata(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getPopularB(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBlogInfo(HashMap<String, String> params) throws Throwable;
}
