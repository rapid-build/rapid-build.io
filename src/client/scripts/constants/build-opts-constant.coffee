angular.module('rapid-build').constant 'BUILD_OPTS', [
	label: 'angular'
	icon:  'fa-cog'
	info:  'for angular 1.x'
	html:
		class: items2: list: 'small'
	items: [
		label: 'version'
		info:  '@type string, @default \'1.x\''
		items: [
			label: 'The version of angular to load.'
			info:  '<a target="_blank" href="http://semver.org/">semver version</a>'
		,
			icon:  'fa-exclamation-circle'
			label: 'Currently the build does not support angular 2
					out of the box.'
		]
	,
		label: 'moduleName'
		info:  '@type string, @default \'app\''
		items: [
			label: 'Application module name.'
		,
			label: 'Value for ng-app in
					<a href="#spa" rb-scroll>spa.html</a> or angular\'s
					<a href="#angular.bootstrap" rb-scroll>bootstrap</a>.'
		]
	,
		label: 'modules'
		info:  '@type array of strings'
		items: [
			label: 'Additional angular modules to load.'
		,
			label: 'By default the build loads
					[\'ngResource\', \'ngRoute\', \'ngSanitize\'].'
		,
			label: 'And \'ngMockE2E\' based on
					angular.<a href="#angular.httpBackend[dev|prod]" rb-scroll>httpBackend</a>
					options.'
		]
	,
		label: 'bootstrap'
		info:  '@type boolean or string, @default false'
		items: [
			label: 'By default the build initializes angular via
					<a target="_blank" href="https://docs.angularjs.org/guide/bootstrap">ng-app</a>
					in <a href="#spa" rb-scroll>spa.html</a>.'
		,
			label: 'Provide true to use angular\'s
					<a target="_blank" href="https://docs.angularjs.org/guide/bootstrap#manual-initialization">bootstrap</a>
					method instead.'
			items: [
				label: 'The build will bootstrap on the document.'
			]
		,
			label: 'Or provide a
					<a target="_blank" href="https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector">css selector</a>
					<em class="sub parens">string</em> to the dom element to bootstrap.'
		,
			label: 'The bootstrap script will load last.'
		]
	,
		label: 'ngFormify'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to replace all html form tags with
					<a target="_blank" href="https://docs.angularjs.org/api/ng/directive/ngForm">ng:form</a>.'
		,
			label: 'Useful if your application is wrapped with a global form tag.'
		]
	,
		label: 'httpBackend[dev|prod]'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to enable httpBackend.'
		,
			label: 'This will load angular module \'ngMockE2E\'.'
		,
			label: 'Dev option applies to default and dev builds.'
		,
			label: 'Prod option applies to prod build.'
		]
	,
		label: 'httpBackend.dir'
		info:  '@type string, @default \'mocks\''
		items: [
			label: 'Directory for your client-side mock data.'
		,
			label: 'Value must be a path relative to your client directory.'
		]
	,
		label: 'templateCache.dev'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to use angular\'s template cache to serve views.'
		,
			label: 'See <a href="#minify.html.templateCache" rb-scroll>here</a>
					to disable angular\'s template cache for prod build.'
		]
	,
		label: 'templateCache.urlPrefix'
		info:  '@type string'
		items: [
			label: 'Prefix for template urls.'
		]
	,
		label: 'templateCache.useAbsolutePaths'
		info:  '@type boolean, @default false'
		items: [
			label: 'Prefix template urls with a \'/\'.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				angular: {
					version: '1.5.x',
					moduleName: 'rapid-build',
					modules: ['ngAnimate'],
					bootstrap: true,
					ngFormify: true,
					httpBackend: {
						dev: true,
						prod: true,
						dir: 'backendless'
					},
					templateCache: {
						dev: true,
						urlPrefix: 'rapid-build',
						useAbsolutePaths: true
					}
				}
			}
		"""
, # =================================================================
	label: 'browser'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'open'
		info:  '@type boolean, @default true'
		items: [
			label: 'Open the browser once the build completes.'
		]
	,
		label: 'reload'
		info:  '@type boolean, @default true'
		items: [
			label: 'Reloads the browser once you save your src file.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				browser: {
					open: false,
					reload: false
				}
			}
		"""
, # =================================================================
	label: 'build'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'client <small class="sep">|</small> server'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to skip building the client or server.'
		,
			icon:  'fa-exclamation-circle'
			label: 'Atleast one must be true.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				build: {
					client: false,
					server: false
				}
			}
		"""
, # =================================================================
	label: 'compile'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'htmlScripts.client.enable'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to compile
					<a target="_blank" href="https://www.w3schools.com/js/js_whereto.asp">inline html scripts</a>
					that have es6 code to es5.'
			info:  'does not apply to external js files'
		,
			label: 'Applies to html files in
					<a href="/getting-started#directory-structure">src/client/views/</a>
					directory.'
			icon:  'fa-exclamation-circle'
		,
			label: 'Useful for creating web components that
					work with unsupported browsers like IE11.'
		,
			label: 'Need to also compile
					<a target="_blank" href="https://www.polymer-project.org/2.0/docs/es6">Polymer 2</a>?
					Set these build options:'
			items: [
				label: '<a href="#exclude.from.dist[client|server]" rb-scroll>exclude.from.dist.client</a>
						=
						[\'bower_components/polymer/**\']'
			,
				label: '<a href="#extra.compile.client[coffee|es6|htmlScripts|less|sass]" rb-scroll>extra.compile.client.htmlScripts</a>
						=
						[\'bower_components/polymer/{polymer*.html,lib/**}\']'

			]
		]
	,
		label: 'typescript[client|server].enable'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to enable client and or server typescript compiler.'
		,
			label: 'Place client typescript files in src/client/scripts/ directory.'
			icon:  'fa-exclamation-circle'
		,
			label: 'Place server typescript files in src/server/ directory.'
			icon:  'fa-exclamation-circle'
		]
	,
		label: 'typescript.client.entries'
		info:  '@type array of strings, @default [\'main.ts\']'
		items: [
			label: 'Entry point(s) of your app.'
			icon:  'fa-exclamation-circle'
			items: [
				label: 'This file(s) is required.'
			,
				label: 'File path(s) must be relative to scripts directory.'
			]
		,
			label: '<a target="_blank" href="http://browserify.org/">Browserify</a>
					is used for module loading.'
		,
			label: 'Must use commonjs for typescript\'s
					<a target="_blank" href="https://www.typescriptlang.org/docs/handbook/compiler-options.html">module code generation</a>.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				compile: {
					htmlScripts: {
						client: {
							enable: true
						}
					},
					typescript: {
						client: {
							enable: true,
							entries: ['init.ts']
						},
						server: {
							enable: true
						}
					}
				}
			}
		"""
, # =================================================================
	label: 'dist'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'dir'
		info:  '@type string, @default \'dist\''
		items: [
			label: 'Provide to name the dist/ directory differently.'
		]
	,
		label: 'client.dir'
		info:  '@type string, @default \'client\''
		items: [
			label: 'Provide to name the dist/client/ directory differently.'
		]
	,
		label: 'client.bower.dir'
		info:  '@type string, @default \'bower_components\''
		items: [
			label: 'Provide to name the dist/client/bower_components/ directory differently.'
		]
	,
		label: 'client.libs.dir'
		info:  '@type string, @default \'libs\''
		items: [
			label: 'Provide to name the dist/client/libs/ directory differently.'
		,
			label: 'Directory for 3rd party libraries that aren\'t bower components.'
		]
	,
		label: 'client[images|scripts|styles|test|views].dir'
		info:  '@type string, @default property name'
		items: [
			label: 'Provide to name the dist/client/property name/ directory differently.'
		,
			label: 'Property name example, \'scripts\''
		]
	,
		label: 'client.paths.absolute'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to create relative urls.'
		,
			label: 'By default the build creates
					<a target="_blank" href="https://goo.gl/jK1i0L">urls absolute</a>
					to the root of your domain for:'
			items: [
				label: 'link tag\'s href attribute'
				info: 'for stylesheets'
			,
				label: 'script tag\'s src attribute'
			,
				label: 'and changes urls in css to absolute'
			]
		]
	,
		label: 'server.dir'
		info:  '@type string, @default \'server\''
		items: [
			label: 'Provide to name the dist/server/ directory differently.'
		]
	,
		label: 'server.test.dir'
		info:  '@type string, @default \'test\''
		items: [
			label: 'Provide to name the dist/server/test/ directory differently.'
		]
	,
		label: 'server.fileName'
		info:  '@type string, @default \'routes.js\''
		items: [
			label: 'This is the server\'s entry script.'
		,
			label: 'Provide if your server\'s entry script isn\'t \'routes.js\''
		]
	,
		label: 'pack.enable'
		info:  '@type boolean, @default false'
		items: [
			icon:  'fa-exclamation-circle'
			label: 'This is the only pack option required.'
		,
			label: 'Set to true to pack the
					<a href="/getting-started#directory-structure">dist directory</a>
					once the build completes.'
		,
			label: 'Pack means the build will create a zip, tar or tgz
					file from the dist directory and place it in your
					project\'s root.'
		]
	,
		label: 'pack.format'
		info:  '@type string, @default \'zip\''
		items: [
			label: 'By default it creates a zip file once the build completes.'
		,
			label: 'Format options:'
			items: [
				label: '<a target="_blank" href="https://en.wikipedia.org/wiki/Zip_(file_format)">zip</a>'
				info:  'default, creates dist.zip'
			,
				label: '<a target="_blank" href="https://en.wikipedia.org/wiki/Tar_(computing)">tar</a>'
				info:  'tarball, creates dist.tar'
			,
				label: '<a target="_blank" href="https://en.wikipedia.org/wiki/Gzip">tgz</a>'
				info:  'gzipped tarball, creates dist.tgz'
			]
		]
	,
		label: 'pack.fileName'
		info:  '@type string, @default \'dist\''
		items: [
			label: 'Name of the packed file.'
		,
			icon:  'fa-exclamation-circle'
			label: 'Leave the file extension off.'
		,
			label: 'Example, app.zip will be created if you supply \'app\'.'
		]
	,
		label: 'pack.glob'
		info:  '@type string or array of strings, @default \'dist/**\''
		items: [
			label: 'This determines what gets packed from the dist directory.'
		,
			label: 'By default all the dist directory\'s contents gets packed.'
		,
			icon:  'fa-exclamation-circle'
			label: '<a target="_blank" href="https://git.io/vDzFO">Glob paths</a>
					must be relative to the dist directory.'
			items: [
				label: 'Do not include \'dist/\' in the beginning of your patterns.'
			,
				label: 'Example, to only include the client directory\'s contents supply \'client/**\'.'
			]
		]
	,
		label: 'pack.includeBase'
		info:  '@type boolean, @default false'
		items: [
			label: 'By default the packed file contains the dist directory\'s contents.'
		,
			label: 'Set to true to also include the dist directory in the packed file.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				dist: {
					dir: 'pkg',
					client: {
						dir: 'frontend',
						bower:   { dir: 'bower' },
						libs:    { dir: 'libraries' },
						images:  { dir: 'img' },
						scripts: { dir: 'js' },
						styles:  { dir: 'css' },
						test:    { dir: 'tests' },
						views:   { dir: 'html' },
						paths:   { absolute: false }
					},
					server: {
						dir: 'backend',
						test: { dir: 'tests' },
						fileName: 'app.js'
					},
					pack: {
						enable: true,
						format: 'tgz',
						fileName: 'app',
						glob: 'client/**',
						includeBase: true
					}
				}
			}
		"""
, # =================================================================
	label: 'exclude'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'spa'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to exclude spa.html from dist/client/'
		]
	,
		label: 'angular.files'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to exclude the angular files
					from dist/client/ that come with rapid-build.'
		,
			label: 'Includes: angular lib, angular
					<a href="#angular.modules" rb-scroll>modules</a>
					and angular <a href="#angular.bootstrap" rb-scroll>bootstrap</a>
					<em class="sub parens">if set</em>.'
		]
	,
		label: 'angular.modules'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to exclude injecting the
					angular <a href="#angular.modules" rb-scroll>modules</a>
					that come with rapid-build.'
		]
	,
		label: 'default[client|server].files'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to exclude the
					client or server files rapid-build
					sends to the dist/client/ or dist/server/
					directory.'
		]
	,
		label: 'from.cacheBust'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths.'
		,
			label: 'Files to exclude from the client-side cache bust.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File paths must be relative to the dist/client/ directory.'
		]
	,
		label: 'from.dist[client|server]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths.'
		,
			label: 'Client or server files to exclude
					from dist/client/ or dist/server/
					directory.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File paths must be relative to the src/client/
					or src/server/ directory.'
		]
	,
		label: 'from.minFile[scripts|styles]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths.'
		,
			label: 'Script or style files to exclude from
					scripts.min.js or styles.min.css file.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File paths must be relative to the dist/client/ directory.'
		]
	,
		label: 'from.spaFile[scripts|styles]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths.'
		,
			label: 'Script or style files to exclude from
					the spa.html file.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File paths must be relative to the dist/client/ directory.'
		]
	,
		label: 'from.spaFile.angular.files'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to exclude the angular files
					from spa.html that come with rapid-build.'
		,
			label: 'Includes: angular lib and angular
					<a href="#angular.modules" rb-scroll>modules</a>.'
		]
	]
	,
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				exclude: {
					spa: true,
					angular: {
						files: true,
						modules: true
					},
					default: {
						client: {
							files: true
						},
						server: {
							files: true
						}
					},
					from: {
						cacheBust: ['images/superheroes/*'],
						dist: {
							client: ['bower_components/bootstrap/less/bootstrap.less'],
							server: ['data/superheroes.json']
						},
						minFile: {
							scripts: ['scripts/ie/ie10.js'],
							styles: ['styles/ie/ie10.css']
						}
						spaFile: {
							scripts: ['scripts/ie/ie10.js'],
							styles: ['styles/ie/ie10.css'],
							angular: {
								files: true
							}
						}
					}
				}
			}
		"""
, # =================================================================
	label: 'extra'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'compile.client[coffee|es6|htmlScripts|less|sass]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths relative
					to src/client/ directory.'
		,
			label: 'Additional files to compile to
					dist/client/ that the build didn\'t compile.'
		]
	,
		label: 'compile.server[less|sass]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths relative
					to src/server/ directory.'
		,
			label: 'Additional files to compile to
					dist/server/ that the build didn\'t compile.'
		]
	,
		label: 'copy[client|server]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths relative to
					src/[client|server]/ directory.'
		,
			label: 'Additional files to copy to
					dist/[client|server]/ that the build didn\'t copy.'
		]
	,
		label: 'minify.client[css|js]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths relative
					to dist/client/ directory.'
		,
			label: 'Additional files to minify in
					dist/client/ that the build didn\'t minify.'
		,
			icon:  'fa-exclamation-circle'
			label: 'By default the build minifies
					files in dist/client/[scripts,styles]/.'
		]
	,
		label: 'watch[client|server]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths relative to
					src/[client|server]/ directory.'
		,
			label: 'Additional files to watch
					in src/[client|server]/ that
					the build didn\'t watch.'
		,
			label: 'Supports watching symlinks.'
			info:  'symlink
					<a target="_blank" href="https://git.io/vrluA">globstars</a>
					not supported on windows'
		,
			icon:  'fa-exclamation-circle'
			label: 'Additional watches only
					copy files, does not compile.'
		,
			icon:  'fa-exclamation-circle'
			label: 'By default the build watches files in src/'
			items: [
				label: 'client/[images,scripts,styles,views]/'
			,
				label: 'server/ (only script files, not json)'
			]
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				extra: {
					compile: {
						client: {
							coffee: ['libs/coffee/utilities.coffee'],
							es6: ['libs/es6/utilities.es6'],
							htmlScripts: ['bower_components/polymer/{polymer*.html,lib/**}'],
							less: ['bower_components/bootstrap/less/bootstrap.less'],
							sass: ['libs/sass/utilities.scss']
						},
						server: {
							less: ['misc/styles.less'],
							sass: ['misc/styles.scss']
						}
					},
					copy: {
						client: ['bower_components/bootstrap/dist/fonts/**'],
						server: ['notes.txt']
					},
					minify: {
						client: {
							css: ['bower_components/bootstrap/less/bootstrap.css'],
							js: ['libs/utilities/strings.js']
						}
					},
					watch: {
						client: ['node_modules/my-pkg/**'],
						server: ['**/*.json']
					}
				}
			}
		"""
, # =================================================================
	label: 'httpProxy'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		info: "@type array of objects"
		items: [
			label: 'Object format:
					{ context: array or string, options: object }'
		,
			label: 'Useful for testing real api data instead of fake data.'
		,
			label: 'For details
					<a target="_blank" href="https://git.io/vVyA0">click here</a>.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				httpProxy: [{
					context: '/api',
					options: {
						target: 'http://localhost:3003/'
					}
				}]
			}
		"""
, # =================================================================
	label: 'inline'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'htmlAssets.enable'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to inline html assets.'
			info:  'useful when creating
					<a target="_blank" href="https://www.webcomponents.org/">web components</a>'
		,
			label: 'Example in html file:'
			code:  '&lt;div&gt;&lt;script src="/scripts/main.js"&gt;&lt;/script&gt;&lt;div&gt;'
		,
			label: 'Inline main.js\'s contents inside script tag resulting in:'
			code:  '&lt;div&gt;&lt;script&gt;console.log(\'Hello world!\')&lt;/script&gt;&lt;div&gt;'
		,
			icon:  'fa-exclamation-circle'
			label: 'Does not inline views in angular\'s
					<a href="#angular.templateCache.dev" rb-scroll>template cache</a>.'
		]
	,
		label: 'htmlAssets.dev'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to run on <a href="/build-types#dev">dev build</a>.'
		,
			label: 'By default
					the build inline\'s html assets on
					<a href="/build-types#default">default</a>
					and <a href="/build-types#prod">prod build</a>.'
			info:  '<a href="#inline.htmlAssets.enable" rb-scroll>if enabled</a>'
		]
	,
		label: 'htmlAssets.options.attribute'
		info:  '@type string'
		items: [
			label: 'By default all html assets will be inlined unless an attribute name is provided.'
		,
			label: 'Place this attribute name on html tags/assets you wish to inline.'
		,
			label: 'Example in html file:'
			code:  '&lt;div&gt;&lt;script inline src="/scripts/main.js"&gt;&lt;/script&gt;&lt;div&gt;'
		,
			icon:  'fa-exclamation-circle'
			label: 'Attribute will be removed from tag after inlining.'
		]
	,
		label: 'htmlAssets.options.svgAsImage'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to convert
					&lt;img src="*.svg"&gt; to &lt;img&gt;
					and not &lt;svg&gt; tag.'
		]
	,
		label: 'htmlAssets.options.ignore'
		info:  '@type array of strings'
		items: [
			label: 'Disable inlining based on file extension and/or html tag.'
		]
	,
		label: 'jsHtmlImports.client.enable'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true to inline js html imports.'
		,
			label: 'Example in js file:'
			code:  'import template from \'../views/xxx.html\';<br>
					return template;'
		,
			label: 'Removes html import statement.'
		,
			label: 'Replaces template variable with
					<a target="_blank" href="https://mzl.la/24ne8EJ">template literal</a>
			 		containing contents of ../views/xxx.html.'
		,
			icon:  'fa-exclamation-circle'
			label: 'Does not inline views in angular\'s
					<a href="#angular.templateCache.dev" rb-scroll>template cache</a>.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				inline: {
					htmlAssets: {
						dev: true,
						enable: true,
						options: {
							attribute: 'inline',
							svgAsImage: true,
							ignore: [
								'img', 'link', 'object', 'script',
								'css', 'js', 'json', 'gif', 'jpg', 'jpeg', 'png', 'svg'
							]
						}
					},
					jsHtmlImports: {
						client: {
							enable: true
						}
					}
				}
			}
		"""
, # =================================================================
	label: 'minify'
	icon:  'fa-cog'
	info:  'applies to <a href="/build-types#prod">prod build</a>'
	html:
		class: items2: list: 'small'
	items: [
		label: 'cacheBust'
		info:  '@type boolean, @default true'
		items: [
			label: 'Ensures viewers of your app
					will always receive the latest client files.'
		,
			label: 'Adds an md5 checksum to the client files
					before their extension.'
		,
			label: 'Cache busted file types are: css, js, gif, jpg, jpeg, png and svg'
		]
	,
		label: 'css.fileName'
		info:  '@type string, @default \'styles.min.css\''
		items: [
			label: 'Provide to name the minified css file differently.'
		]
	,
		label: 'css.splitMinFile'
		info:  '@type boolean, @default false'
		items: [
			label: 'Split styles.min.css into multiple files
					if the selector count > 4,095'
		,
			label: 'Useful if you have many css selectors
					and have to support ie 8 and 9.'
		,
			label: 'For details
					<a target="_blank" href="http://blesscss.com/">click here</a>.'
		]
	,
		label: 'css.styles'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to not minify your css files.'
		]
	,
		label: 'html.options'
		info:  '@type object, @default see below'
		items: [
			label: 'Defaults to:
					{ collapseWhitespace: true,
					removeComments: true,
					removeEmptyElements: false,
					removeEmptyAttributes: false }'
		,
			label: 'For details
					<a target="_blank" href="https://git.io/vVyAC">click here</a>.'
		]
	,
		label: 'html.views'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to not minify your html files.'
		]
	,
		label: 'html.templateCache'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to not use angular\'s
					template cache for your html files.'
		,
			label: 'See <a href="#angular.templateCache.dev" rb-scroll>here</a>
					to enable angular\'s template cache for dev build.'
		]
	,
		label: 'spa.file'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to not minify your spa.html file.'
		]
	,
		label: 'server.json.enable'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to not minify your server json files.'
		]
	,
		label: 'client.js.fileName'
		info:  '@type string, @default \'scripts.min.js\''
		items: [
			label: 'Provide to name the minified js file differently.'
		]
	,
		label: '[client|server].js.enable'
		info:  '@type boolean, @default true'
		items: [
			label: 'Set to false to not minify your js files.'
		]
	,
		label: '[client|server].js.es6'
		info:  '@type boolean, @default false'
		items: [
			label: 'Set to true if your js files are written in ES6+.'
		,
			icon:  'fa-exclamation-circle'
			label: 'Unless you enable this option, the build expects your js files to be written in ES5.'
		]
	,
		label: '[client|server].js.options'
		info:  '@type object, @default {}'
		items: [
			label: 'Find available options here:
					<a target="_blank" href="https://git.io/vFbk9">ES5</a>
					or
					<a target="_blank" href="https://git.io/vFbkj">ES6+</a>.',
		,
			icon:  'fa-exclamation-circle'
			label: 'ES5 is the default unless you enable <a href="#minify.[client|server].js.es6" rb-scroll>ES6+</a>.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				minify: {
					cacheBust: false,
					css: {
						fileName: 'rapid-build.min.css',
						splitMinFile: true,
						styles: false
					},
					html: {
						templateCache: false,
						views: false,
						options: {
							removeComments: true
						}
					},
					spa: {
						file: false
					},
					client: {
						js: {
							es6: true,
							options: { mangle: false },
							fileName: 'rapid-build.min.js'
						}
					},
					server: {
						js: { enable: false },
						json: { enable: false }
					}
				}
			}
	"""
, # =================================================================
	label: 'order'
	icon:  'fa-cog'
	info:  'client only'
	html:
		class: items2: list: 'small'
	items: [
		label: '[scripts|styles][first|last]'
		info:  '@type array of strings'
		items: [
			label: 'Array of file paths to css or js files.'
		,
			label: 'Use first to load specific scripts or styles first.'
		,
			label: 'Use last to load specific scripts or styles last.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File paths must be relative to the dist/client/ directory.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				order: {
					scripts: {
						first: ['scripts/bootstrap.js'],
						last: ['scripts/init.js']
					},
					styles: {
						first: ['styles/reset.css'],
						last: ['styles/utilities.css']
					}
				}
			}
		"""
, # =================================================================
	label: 'ports'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'reload'
		info:  '@type int, @default 3001'
		items: [
			label: 'Browsersync server port.'
		]
	,
		label: 'reloadUI'
		info:  '@type int, @default 3002'
		items: [
			label: 'Browsersync\'s user-interface server port.'
		]
	,
		label: 'server'
		info:  '@type int, @default 3000'
		items: [
			label: 'Web server port.'
		]
	,
		label: 'test'
		info:  '@type int, @default 9876'
		items: [
			label: 'Karma server port.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				ports: {
					reload: 5002,
					reloadUI: 5003,
					server: 5000,
					test: 5004
				}
			}
		"""
, # =================================================================
	label: 'security'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'client.clickjacking'
		info:  '@type boolean, @default true'
		items: [
			label: 'The build will include a
					<a target="_blank" href="https://www.owasp.org/index.php/Clickjacking">clickjacking</a>
					defense script in the your spa.html (set to false to disable).'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				security: {
					client: {
						clickjacking: false
					}
				}
			}
		"""
, # =================================================================
	label: 'spa'
	icon:  'fa-cog'
	info:  'single page application'
	html:
		class: items2: list: 'small'
	items: [
		label: 'autoInject'
		info:  '@type array of strings, @default [\'all\']'
		items: [
			label: 'The build will automatically
					inject the following into your spa.html:'
			items: [
				label: '<a href="#security.client.clickjacking" rb-scroll>clickjacking</a>'
			,
				label: '<a href="#angular.moduleName" rb-scroll>moduleName</a>'
				info:  'ng-app attribute'
			,
				label: '<a target="_blank" href="https://docs.angularjs.org/api/ng/directive/ngCloak">ngCloakStyles</a>'
			,
				label: 'scripts'
				info:  'all your js files'
			,
				label: 'styles'
				info:  'all your css files'
			]
		,
			label: 'Or provide to the array the options you want.'
		,
			icon:  'fa-exclamation-circle'
			label: 'Disable auto injection by setting to false <em class="sub parens">boolean</em>.'
		]
	,
		label: 'description'
		info:  '@type string, @default package.json description'
		items: [
			label: 'Default spa.html meta description tag value.'
		]
	,
		label: 'placeholders'
		info:  '@type array of strings'
		items: [
			label: 'Retain spa.html file placeholders.'
		,
			label: 'Options include <em class="sub parens">all or individuals</em>:'
			items: [
				label: 'all'
			,
				label: 'clickjacking, description, moduleName,
						ngCloakStyles, scripts, styles and title'
			]
		]
	,
		label: 'title'
		info:  '@type string, @default package.json name or \'Application\''
		items: [
			label: 'Default spa.html title tag value.'
		]
	,
		label: 'dist.fileName'
		info:  '@type string, @default file name of spa.src.filePath or \'spa.html\''
		items: [
			label: 'Provide to name dist/client/spa.html file differently.'
		,
			label: 'Example: \'index.html\''
		]
	,
		label: 'src.filePath'
		info:  '@type string'
		items: [
			label: 'Provide to use your own spa.html
					file and not the build\'s default spa.html.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File must be located in the src/client/ directory.'
		,
			icon:  'fa-exclamation-circle'
			label: 'File path must be relative to the src/client/ directory.'
		]
	,
		label: '[scripts|styles].attrs'
		info:  '@type object, @default see below'
		items: [
			label: 'Add additional attributes to the link (styles) and script
					tags that the build outputs in spa.html.'
		,
			label: 'Or modify the default attributes that the build places
					on the link and script tags.'
		,
			label: 'To create a valueless attribute, set it\'s value to null.'
		,
			label:  'Build defaults for:'
			items: [
				label: 'script tags: { src: \'path to .js file\' }'
			,
				label: 'link tags: { rel: \'stylesheet\', href: \'path to .css file\' }'
			]
		,
			label: 'Build output example:'
			items: [
				label: '&lt;script src="/scripts/super.js"&gt;&lt;/script&gt;'
			,
				label: '&lt;link rel="stylesheet" href="/styles/awesome.css"&gt;'
			]
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				spa: {
					autoInject: false,
					description: 'Documentation website for rapid-build.',
					placeholders: ['all'],
					title: 'Rapid Build',
					dist: {
						fileName: 'index.html'
					},
					src: {
						filePath: 'spa.html'
					},
					scripts: {
						attrs: {
							async: null
						}
					},
					styles: {
						attrs: {
							rel: 'import',
							type: 'css'
						}
					}
				}
			}
		"""
, # =================================================================
	label: 'src'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'dir'
		info:  '@type string, @default \'src\''
		items: [
			label: 'Provide to name the src/ directory differently.'
		]
	,
		label: 'client.dir'
		info:  '@type string, @default \'client\''
		items: [
			label: 'Provide to name the src/client/ directory differently.'
		]
	,
		label: 'client.bower.dir'
		info:  '@type string, @default \'bower_components\''
		items: [
			label: 'Provide to name the src/client/bower_components/
					directory differently.'
		]
	,
		label: 'client.libs.dir'
		info:  '@type string, @default \'libs\''
		items: [
			label: 'Provide to name the src/client/libs/
					directory differently.'
		,
			label: 'Directory for 3rd party libraries
					that aren\'t bower components.'
		]
	,
		label: 'client[images|scripts|styles|test|views].dir'
		info:  '@type string, @default property name'
		items: [
			label: 'Provide to name the src/client/property name/
					directory differently.'
		,
			label: 'Property name example, \'scripts\''
		]
	,
		label: 'server.dir'
		info:  '@type string, @default \'server\''
		items: [
			label: 'Provide to name the src/server/ directory differently.'
		]
	,
		label: 'server.test.dir'
		info:  '@type string, @default \'test\''
		items: [
			label: 'Provide to name the src/server/test/
					directory differently.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				src: {
					dir: 'source',
					client: {
						dir: 'frontend',
						bower:   { dir: 'bower' },
						libs:    { dir: 'libraries' },
						images:  { dir: 'img' },
						scripts: { dir: 'js' },
						styles:  { dir: 'css' },
						test:    { dir: 'tests' },
						views:   { dir: 'html' }
					},
					server: {
						dir: 'backend',
						test: { dir: 'tests' }
					}
				}
			}
		"""
, # =================================================================
	label: 'test'
	icon:  'fa-cog'
	html:
		class: items2: list: 'small'
	items: [
		label: 'client.browsers'
		info:  '@type array of strings'
		items: [
			label: 'Array of browser names.'
		,
			label: 'Phantomjs will run by default.'
		]
	]
	example:
		label: 'Example'
		info:  '<a href="/getting-started#rapid-build.json">for rapid-build.json</a>'
		lang:  'js'
		size:  'small'
		code:  """
			{
				test: {
					client: {
						browsers: ['chrome', 'firefox', 'ie', 'safari']
					}
				}
			}
		"""
]










