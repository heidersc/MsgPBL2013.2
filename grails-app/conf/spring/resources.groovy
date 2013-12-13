beans = {
    localeResolver(org.springframework.web.servlet.i18n.SessionLocaleResolver) {
        defaultLocale = new Locale("pt", "BR")
        java.util.Locale.setDefault(defaultLocale)
    }

    httpClient(wslite.http.HTTPClient) {
        connectTimeout = 5000
        readTimeout = 60000
        useCaches = false
        followRedirects = false
        sslTrustAllCerts = true
    }

    soapClient(wslite.soap.SOAPClient) {
        httpClient = ref('httpClient')
    }
}