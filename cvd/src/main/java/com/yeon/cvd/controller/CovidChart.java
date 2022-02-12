package com.yeon.cvd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.yeon.cvd.common.Command;

public class CovidChart implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		
		return "covid19live/livechart";
	}
}
