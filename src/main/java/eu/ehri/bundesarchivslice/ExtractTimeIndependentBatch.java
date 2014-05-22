package eu.ehri.bundesarchivslice;

import java.io.File;
import java.io.InputStream;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class ExtractTimeIndependentBatch {
	public static void extractTimeIndependentData(String ba_ead)
			throws TransformerException {


		ClassLoader classloader = Thread.currentThread()
				.getContextClassLoader();
		InputStream is = classloader
				.getResourceAsStream("BA_split_2_batch.xsl");

		TransformerFactory t_factory = TransformerFactory.newInstance();
		System.out.println(t_factory.getClass().getCanonicalName());
		
		Source xslt = new StreamSource(is);
		
		Source ead = new StreamSource(new File(ba_ead));
		Transformer transformer = t_factory.newTransformer(xslt);
		Result out = new StreamResult(System.out);
		transformer.transform(ead, out);

	}
}
