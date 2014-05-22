package eu.ehri.bundesarchivslice;

import java.io.File;
import java.io.IOException;

import javax.xml.stream.XMLStreamException;
import javax.xml.transform.TransformerException;

/**
 * Select paths in the Bundesarchiv EAD and slice them.
 * Select relevant data range for one of the batches
 * 
 */
public class App {
	public static void main(String[] args) throws XMLStreamException,
			IOException, TransformerException {
		String ba_ead = args[0];
		String outputfolder = "BundesarchivSelection";
		File dir = new File(outputfolder);
		dir.mkdir();

		ExtractTimeDependentBatch.extractTimeDependentData(ba_ead);
			
		//Move the extracted files to ./selected folder
		File local = new File(".");
		File[] filesList = local.listFiles();
		for (File file : filesList) {
			if (file.isFile()
					&& file.getName().toString().matches("BA_split.+\\.xml")) {
				file.renameTo(new File(outputfolder + "/" + file.getName()));
			}
		}
		
		//Delete files with data outside of the range
		SelectRelevantDates.checkDate(outputfolder);
		
		ExtractTimeIndependentBatch.extractTimeIndependentData(ba_ead);
		
		//Move the extracted files to ./selected folder
		filesList = local.listFiles();
		for (File file : filesList) {
			if (file.isFile()
					&& file.getName().toString().matches("BA_split.+\\.xml")) {
				file.renameTo(new File(outputfolder + "/" + file.getName()));
			}
		}
	}
}
