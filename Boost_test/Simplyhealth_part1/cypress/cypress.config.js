const { defineConfig } = require('cypress')

module.exports = defineConfig({
	 userAgent:
    'Chrome/114.0.5735.111',
    e2e: {
    
        baseUrl: 'https://www.simplyhealth.co.uk'
    }
})