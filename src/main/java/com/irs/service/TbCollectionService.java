package com.irs.service;

import java.util.List;


import com.irs.bean.TbCollection;

/**
 * 用户收藏
 * @author robb
 *
 */
public interface TbCollectionService {
	
    List<TbCollection> list(Integer uid );
	
	int insert(TbCollection bean);

	int delete(Integer id);
	
}
