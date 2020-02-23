package com.gd.test.web.test.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.web.test.service.ITestService;

@Controller
public class TestController {
	@Autowired
	public ITestService iTestService;

	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = { "/test1", "/test" })
	public ModelAndView test1(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		if (params.get("page") == null) { // 페이지 번호
			params.put("page", "1");
		}

		int cnt = iTestService.getListCnt(params); // 게시물 개수(검색에 따라 바뀜 = param)

		// 페이징 데이터 생성(페이징 서비스 활용)
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt);

		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iTestService.getList(params); // 목록 조회

		// 조회한 목록을 반환
		mav.addObject("list", list);
		mav.addObject("pb", pb);
		mav.addObject("page", params.get("page"));

		mav.setViewName("test/test1");

		return mav;
	}

	@RequestMapping(value = "/test2")
	public ModelAndView test2(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		iTestService.updateHit(params);

		HashMap<String, String> data = iTestService.getData(params);

		mav.addObject("data", data);

		mav.setViewName("test/test2");

		return mav;
	}

	@RequestMapping(value = "/test3")
	public ModelAndView test3(ModelAndView mav) {
		mav.setViewName("test/test3");

		return mav;
	}

	@RequestMapping(value = "/test3s")
	public ModelAndView test3s(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iTestService.insertData(params);
			// setViewName에서의 redirect
			// -> 해당 주소로 이동. 컨트롤러에서 컨트롤러로 이동.
			// 단, Get방식으로 이동하기 때문에 단순이동을 제외하고는 redirect를 자제
			mav.setViewName("redirect:test1");
		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("test/test3s");
		}

		return mav;
	}

	@RequestMapping(value = "/test4")
	public ModelAndView test4(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> data = iTestService.getData(params);

		mav.addObject("data", data);

		mav.setViewName("test/test4");

		return mav;
	}

	@RequestMapping(value = "/test4s")
	public ModelAndView test4s(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iTestService.updateData(params);
		} catch (Exception e) {
			e.printStackTrace();
			res = "false";
		}
		mav.addObject("res", res);

		mav.setViewName("test/test4s");
		return mav;
	}

	@RequestMapping(value = "/test5s")
	public ModelAndView test5s(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iTestService.deleteData(params);
			mav.setViewName("redirect:test1");
		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("test/test5s");
		}
		return mav;
	}

	@RequestMapping(value = "/tjoin")
	public ModelAndView tjoin(ModelAndView mav) {
		mav.setViewName("test/tjoin");

		return mav;
	}

	@RequestMapping(value = "/tjoins")
	public ModelAndView tjoins(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iTestService.joinData(params);

			mav.setViewName("redirect:tlogin");
		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("test/tjoins");
		}

		return mav;
	}

	@RequestMapping(value = "/tlogin")
	public ModelAndView tlogin(HttpSession session, ModelAndView mav) {
		if (session.getAttribute("sMemNo") != null) {
			mav.setViewName("redirect:tmain");
		} else {
			mav.setViewName("test/tlogin");
		}
		return mav;
	}

	@RequestMapping(value = "/tlogins")
	public ModelAndView tlogins(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		HashMap<String, String> data = iTestService.getMem(params);

		if (data != null) {
			session.setAttribute("sMemNo", data.get("MEM_NO"));
			session.setAttribute("sMemId", data.get("MEM_ID"));
			session.setAttribute("sMemNm", data.get("MEM_NM"));

			System.out.println(session.getAttribute("sMemNm"));

			mav.setViewName("redirect:tmain");
		} else {
			mav.setViewName("test/tlogins");
		}
		return mav;
	}

	@RequestMapping(value = "/tmain")
	public ModelAndView tmain(HttpSession session, ModelAndView mav) {
		if (session.getAttribute("sMemNo") != null) {
			mav.setViewName("test/tmain");
		} else {
			mav.setViewName("redirect:tlogin");
		}
		return mav;
	}

	@RequestMapping(value = "/tlogout")
	public ModelAndView tlogout(HttpSession session, ModelAndView mav) {
		session.invalidate();

		mav.setViewName("redirect:tlogin");

		return mav;
	}

	// 회원가입형 게시판
	@RequestMapping(value = "/bJoin")
	public ModelAndView bJoin(ModelAndView mav) {
		mav.setViewName("test/bJoin");

		return mav;
	}

	@RequestMapping(value = "/bJoins")
	public ModelAndView bJoins(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {

			int cnt = iTestService.bCheckedId(params);

			if (cnt != 0) {
				mav.addObject("res", "1");
				mav.setViewName("test/bJoins");
			} else {
				try {
					iTestService.bJoinData(params);
					mav.setViewName("redirect:bLogin");
				} catch (Exception e) {
					mav.addObject("res", "0");
					e.printStackTrace();
					mav.setViewName("test/bJoins");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/bLogin")
	public ModelAndView bLogin(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("bMemNo") != null) {
			mav.setViewName("redirect:bMain");
		} else {
			mav.setViewName("test/bLogin");
		}
		return mav;
	}

	@RequestMapping(value = "/bLogins")
	public ModelAndView bLogins(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		HashMap<String, String> bdata = iTestService.bGetMem(params);

		if (bdata != null) {
			session.setAttribute("bMemId", bdata.get("BM_ID"));
			session.setAttribute("bMemNo", bdata.get("BM_NO"));
			session.setAttribute("bMemNm", bdata.get("BM_NM"));

			System.out.println(session.getAttribute("bMemNo"));

			mav.setViewName("redirect:bMain");
		} else {
			mav.setViewName("test/bLogins");
		}
		return mav;
	}

	@RequestMapping(value = "/bLogout")
	public ModelAndView bLogout(HttpSession session, ModelAndView mav) {
		session.invalidate();

		mav.setViewName("redirect:bLogin");

		return mav;
	}

	@RequestMapping(value = "/bMain")
	public ModelAndView bMain(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		if (params.get("page") == null) { // 페이지 번호
			params.put("page", "1");
		}
		
		int cnt = iTestService.bGetListCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt);

		
		params.put("bStartCount", Integer.toString(pb.getStartCount()));
		params.put("bEndCount", Integer.toString(pb.getEndCount()));
		List<HashMap<String, String>> list = iTestService.bGetList(params);
		mav.addObject("list", list);
		
		mav.addObject("list", list);
		mav.addObject("pb", pb);
		mav.addObject("page", params.get("page"));

		mav.setViewName("test/bMain");
		return mav;
	}

	@RequestMapping(value = "/bWrite")
	public ModelAndView bWrite(HttpSession session, ModelAndView mav) {
		mav.setViewName("test/bWrite");

		return mav;
	}

	@RequestMapping(value = "/bWrites")
	public ModelAndView bWrites(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iTestService.bInsertData(params);
			mav.setViewName("redirect:bMain");
		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("test/bWrites");
		}
		return mav;
	}

	@RequestMapping(value = "/bDetail")
	public ModelAndView bDetail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		iTestService.bUpdateHit(params);

		HashMap<String, String> bDeData = iTestService.bGetData(params);

		mav.addObject("bDeData", bDeData);

		mav.setViewName("test/bDetail");

		return mav;
	}

	@RequestMapping(value = "/bDelete")
	public ModelAndView bDelete(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		iTestService.bDeleteData(params);

		mav.setViewName("test/bDelete");

		return mav;
	}

	@RequestMapping(value = "/bUpdate")
	public ModelAndView bUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> bData = iTestService.bGetData(params);

		mav.addObject("bData", bData);
		mav.setViewName("test/bUpdate");

		return mav;
	}

	@RequestMapping(value = "/bUpdates")
	public ModelAndView bUpdates(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iTestService.bUpdateData(params);
		} catch (Exception e) {
			e.printStackTrace();
			res = "false";
		}
		mav.addObject("res", res);
		mav.setViewName("test/bUpdates");
		return mav;
	}

	@RequestMapping(value = "/bmUpdate")
	public ModelAndView bmUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			HashMap<String, String> bmData = iTestService.bmGetData(params);
			mav.addObject("bmData", bmData);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.setViewName("test/bmUpdate");

		return mav;
	}

	@RequestMapping(value = "/bmUpdates")
	public ModelAndView bmUpdates(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
				try {
					iTestService.bmUpdateData(params);
					mav.setViewName("redirect:bLogin");
				} catch (Exception e) {
					e.printStackTrace();
					mav.setViewName("test/bUpdates");
				}
		return mav;
		}
	
	@RequestMapping(value = "/tFile")
	public ModelAndView tFile(ModelAndView mav) {
		mav.setViewName("test/tFile");

		return mav;
	}
	
	@RequestMapping(value = "/test/{no}")
	// @PathVariable(경로의 키) 변수타입 변수명
	// 경로에서 해당 키 부분의 값을 변수에 할당
	public ModelAndView testex(@PathVariable("no") int bNo,
								ModelAndView mav) {
		System.out.println(bNo);
		mav.setViewName("test/test1");

		return mav;
	}
}
