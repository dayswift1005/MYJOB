package com.kh.myjob.course.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myjob.course.vo.CourseRegVO;
import com.kh.myjob.course.vo.CourseVO;
import com.kh.myjob.course.vo.LocationVO;
import com.kh.myjob.course.vo.PlaceVO;
import com.kh.myjob.course.vo.TempSaveCourseVO;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<LocationVO> selectHighLocationList() {
		return sqlSession.selectList("courseMapper.selectHighLocationList");
	}

	@Override
	public List<LocationVO> selectLowLocationList(LocationVO locationVO) {
		return sqlSession.selectList("courseMapper.selectLowLocationList",locationVO);
	}

	@Override
	public List<PlaceVO> selectPlaceList(PlaceVO placeVO) {
		return sqlSession.selectList("courseMapper.selectPlaceList", placeVO);
	}

	@Override
	public CourseVO checkCourseName(CourseVO courseVO) {

		return sqlSession.selectOne("courseMapper.checkCourseName",courseVO);
	}

	@Override
	public void insertCourseCode(CourseVO courseVO) {
		
		sqlSession.selectOne("courseMapper.insertCourseCode",courseVO);
	}

	@Override
	public CourseVO selectCourseCode(CourseVO courseVO) {
		
		return sqlSession.selectOne("courseMapper.selectCourseCode", courseVO);
	}

	@Override
	public int insertCourseByCourseCode(CourseRegVO courseRegVO) {
		return sqlSession.insert("courseMapper.insertCourseByCourseCode", courseRegVO);
		
	}
	
	@Override
	public int selectTotalCnt(PlaceVO placeVO) {
		return sqlSession.selectOne("courseMapper.selectTotalCnt", placeVO);
	}

	@Override
	public List<CourseVO> selectCoursePlaceList(CourseVO courseVO) {
		
		return sqlSession.selectList("courseMapper.selectCourseByMemberId",courseVO);
	}

	@Override
	public int deleteCourse(CourseVO courseVO) {
		return sqlSession.delete("courseMapper.deleteCourse", courseVO);
	}
	
	@Override
	public int deletePlaceInCourse(CourseRegVO courseRegVO) {
		return sqlSession.delete("courseMapper.deletePlaceInCourse", courseRegVO);
	}

	@Override
	public List<CourseVO> selectCoursePlaceListByCourseCode(CourseVO courseVO) {
		return sqlSession.selectList("courseMapper.selectCourseByCourseCode", courseVO);
	}

	@Override
	public void insertTempSaveCourse(CourseRegVO courseRegVO) {
		sqlSession.insert("courseMapper.insertTempSaveCourse", courseRegVO);		
	}

	@Override
	public List<TempSaveCourseVO> selectTempSaveCourse(TempSaveCourseVO tempSaveCourseVO) {
		return sqlSession.selectList("courseMapper.selectTempSaveCourse", tempSaveCourseVO);
	}

	@Override
	public void deleteCheck(CourseRegVO courseRegVO) {
		sqlSession.delete("courseMapper.deleteCheck", courseRegVO);
	}

	

}
