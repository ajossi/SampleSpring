package com.gd.test.web.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.util.Utils;
import com.gd.test.web.blog.service.IBlogService;

@Controller
public class BlogController {
	@Autowired
	public IBlogService iBlogService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = {"/blogMain"})
	public ModelAndView blogMain(ModelAndView mav,
			@RequestParam HashMap<String, String> params) throws Throwable {
		
		mav.setViewName("blog/blogMain");
		
		return mav;
	}
	
	@RequestMapping(value = "/popularBListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String popularBListAjax(@RequestParam HashMap<String, String> params,
			HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
				List<HashMap<String, String>> popularBList = iBlogService.getPopularB(params);
				
				modelMap.put("popularBList", popularBList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = {"/blogUser/{no}"})
	public ModelAndView blogUser(ModelAndView mav, HttpSession session, @PathVariable("no") int blogNo,
			@RequestParam HashMap<String, String> params) throws Throwable {
		
		HashMap<String, String> blogInfo = iBlogService.getBlogInfo(params);
		
		mav.addObject("blogInfo", blogInfo);
		mav.addObject("blogNo", blogNo);
		mav.setViewName("blog/blogUser");
		
		return mav;
	}
	
	@RequestMapping(value = "/listAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listAjax(@RequestParam HashMap<String, String> params,
			HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iBlogService.getBCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
				List<HashMap<String, String>> list = iBlogService.getB(params);
				
				modelMap.put("list", list);
				modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/detailAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String detailAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			//조회수 증가시키기
			iBlogService.updateBhit(params);
			//게시물 상세데이터 가져오기
			HashMap<String, String> data = iBlogService.getBdata(params);
				
			modelMap.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/cateListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cateListAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBlogService.getBCnt(params);
		
			List<HashMap<String, String>> cateList = iBlogService.getCate(params);
			
			modelMap.put("cateList", cateList);
			modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/cateAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cateAddAjax(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iBlogService.insertCate(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
//	@RequestMapping(value = "/archiveListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
//	@ResponseBody
//	public String archiveListAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
//			throws Throwable {
//		ObjectMapper mapper = new ObjectMapper();
//		Map<String, Object> modelMap = new HashMap<String, Object>();
//		
//			List<HashMap<String, String>> archiveList = iBlogService.getArchive(params);
//			
//			modelMap.put("archiveList", archiveList);
//		
//		return mapper.writeValueAsString(modelMap);
//	}
	
	@RequestMapping(value = {"/blogLogin"})
	public ModelAndView blogLogin(ModelAndView mav, HttpSession session) {
		
		if(session.getAttribute("sBmNo") != null) {
			mav.setViewName("redirect:blogMain");
		} else {
			mav.setViewName("blog/blogLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value = {"/blogJoin"})
	public ModelAndView blogJoin(ModelAndView mav) {
		
		mav.setViewName("blog/blogJoin");
		
		return mav;
	}
	
	@RequestMapping(value = "/bIdCheckAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 Vice를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String bIdCheckAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBlogService.idCheck(params);

		modelMap.put("cnt", cnt);

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bNmCheckAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 Vice를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String bNmCheckAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBlogService.nmCheck(params);

		modelMap.put("cnt", cnt);

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bJoinAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 Vice를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String bJoinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			// 비밀번호 암호화
			params.put("bmPwtxt", Utils.encryptAES128(params.get("bmPwtxt")));

			iBlogService.insertBM(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bLoginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 Vice를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String bLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		// 비밀번호 암호화
		try {
			params.put("bmPwtxt", Utils.encryptAES128(params.get("bmPwtxt")));
			
			HashMap<String, String> data = iBlogService.getBM(params);
			
			if (data != null) {
				session.setAttribute("sBmNo", data.get("BM_NO"));
				session.setAttribute("sBmNm", data.get("BM_NM"));
				
				modelMap.put("res", "SUCCESS");
			} else {
				modelMap.put("res", "FAILED");
			}
			
		} catch (Exception e) {
			
		}

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/blogLogout")
	public ModelAndView aLogout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:blogMain");

		return mav;
	}
	
	@RequestMapping(value = {"/blogWrite"})
	public ModelAndView blogWrite(ModelAndView mav, HttpSession session) {
		
		if(session.getAttribute("sBmNo") == null) {
			mav.setViewName("redirect:blogMain");
		} else {
			mav.setViewName("blog/blogWrite");
		}		
		
		return mav;
	}
	
	@RequestMapping(value = "/bWriteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 Vice를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String bWriteAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iBlogService.insertB(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bCommentInsertAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 Vice를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String bCommentAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iBlogService.insertComment(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 덧글목록 */
	@RequestMapping(value = "/bCommentListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bCommentListAjax(@RequestParam HashMap<String, String> params,
			HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int commentCnt = iBlogService.getCommentCnt(params);
			
			PagingBean commentPB = iPagingService.getPagingBean(Integer.parseInt(params.get("commentPage")), commentCnt, 10, 5);

			params.put("commentStartCnt", Integer.toString(commentPB.getStartCount()));
			params.put("commentEndCnt", Integer.toString(commentPB.getEndCount()));
			
				List<HashMap<String, String>> commentList = iBlogService.getComment(params);
				
				modelMap.put("commentCnt", commentCnt);
				modelMap.put("commentList", commentList);
				modelMap.put("commentPB", commentPB);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = {"/blogUpdate"})
	public ModelAndView blogUpdate(ModelAndView mav, @RequestParam HashMap<String, String> params)throws Throwable {
		
		HashMap<String, String> data = iBlogService.getBdata(params);
		mav.addObject("data", data);
		mav.setViewName("blog/blogUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/blogUpdates")
	public ModelAndView blogUpdates(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iBlogService.bUpdateData(params);
		} catch (Exception e) {
			e.printStackTrace();
			res = "false";
		}
		mav.addObject("res", res);
		mav.setViewName("blog/blogUpdates");
		return mav;
	}
	
	@RequestMapping(value = {"/blogDelete"})
	public ModelAndView blogDelete(ModelAndView mav, @RequestParam HashMap<String, String> params)throws Throwable {
		
		try {
			iBlogService.deleteBdata(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("blog/blogDelete");
		
		return mav;
	}
	
//	@RequestMapping(value = {"/blogMUpdate"})
//	public ModelAndView blogMUpdate(ModelAndView mav) {
//		
//		mav.setViewName("blog/blogMUpdate");
//		
//		return mav;
//	}
	
//	@RequestMapping(value = {"/blogTema"})
//	public ModelAndView blogTema(ModelAndView mav) {
//		
//		mav.setViewName("blog/blogTema");
//		
//		return mav;
//	}
}
	
