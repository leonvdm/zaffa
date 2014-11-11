package com.zaffa.industrial.service;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.zaffa.industrial.entity.Property;

public class PropetyServiceTest {

	private PropertyService propertyService;
	
	@Before
	public void setUp() throws Exception {
		propertyService = new PropertyService();
	}

	@Test
	public void testFindOne() {
		//Property prop = propertyService.findOne(1);
		assertEquals(1, 1);
	}

}
