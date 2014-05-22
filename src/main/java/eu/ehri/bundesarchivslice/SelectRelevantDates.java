package eu.ehri.bundesarchivslice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

public class SelectRelevantDates {

	public static void checkDate(String directory) throws XMLStreamException,
			IOException {

		boolean bestandslaufzeit = false;
		String content = null;
		String dates = null;

		File dir = new File(directory);

		File[] filesList = dir.listFiles();

		for (File file : filesList) {
			if (file.isFile()) {
				boolean relevant = false;
				InputStream input = new FileInputStream(file);
				XMLInputFactory inputFactory = XMLInputFactory.newInstance();
				XMLStreamReader xmlStreamReader = inputFactory
						.createXMLStreamReader(input);

				while (xmlStreamReader.hasNext()) {
					int event = xmlStreamReader.next();

					switch (event) {
					case XMLStreamConstants.START_ELEMENT:
						switch (xmlStreamReader.getLocalName()) {
						case "unitdate":
							String att_value = xmlStreamReader
									.getAttributeValue(0);
							if (att_value.equals("Bestandslaufzeit")) {
								bestandslaufzeit = true;
							}

						}
						break;
					case XMLStreamConstants.CHARACTERS:
						content = xmlStreamReader.getText();
						break;
					case XMLStreamConstants.END_ELEMENT:
						switch (xmlStreamReader.getLocalName()) {
						case "unitdate":
							if (bestandslaufzeit == true) {
								dates = content;
							}
						}
					}
				}

				String[] years = dates.split(" ");
				for (int i = 0; i < years.length; i++) {
					String chunk = years[i];
					chunk.replace("\\(", "");
					chunk.replace("\\)", "");
					chunk.replace(",", "");
					chunk.replace(";", "");
					chunk.replace("-", "");
					if (chunk.matches("[0-9]{4}/[0-9]{4}")) {
						String[] period = chunk.split("/");
						String begin = period[0];
						int b = Integer.parseInt(begin);
						String end = period[1];
						int e = Integer.parseInt(end);
						if (((b <= 1933) && (e >= 1945))
								|| ((e >= 1933) && (e <= 1945))
								|| ((b >= 1933) && (e <= 1945))) {
							relevant = true;
						}
					} else {
						if (chunk.matches("19[0-9]{2}/[0-9]{2}")) {
							String[] period = chunk.split("/");
							String begin = period[0];
							int b = Integer.parseInt(begin);
							String end = "19" + period[1];
							int e = Integer.parseInt(end);
							if (((b <= 1933) && (e >= 1945))
									|| ((e >= 1933) && (e <= 1945))
									|| ((b >= 1933) && (e <= 1945))) {
								relevant = true;
							}
						} else {
							if (chunk.matches("19[0-9]{2}")) {
								int y = Integer.parseInt(chunk);
								if ((y >= 1933) && (y <= 1945)) {
									relevant = true;
								}
							}
						}
					}
				}

				xmlStreamReader.close();
				input.close();
				
				if (relevant == false){
					file.delete();
				}
				
			}

		}
	}

}
