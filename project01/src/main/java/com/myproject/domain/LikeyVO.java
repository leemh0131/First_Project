package com.myproject.domain;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/* @Data(어노태이션)
 * - @Getter, @Setter, @RequiredArgsConstructor, @ToString,
 *   @EqualsAndHashCode 까지 다 해줌.
*/

@Data
public class LikeyVO {
	
	private int 			bno;
	private int 			member_code;
	private int 			product_code;
	private Timestamp		register_date;
	
	private List<LikeyVO> 	list;
	
	public LikeyVO() {					//생성자
		list = new ArrayList<LikeyVO>();
	}
	
	
	

}
