return {
	    -- Lua LSP
	    lua_ls = {
		    settings = {
			    Lua = {
				    -- Improve completion
				    completion = {
					    callSnippet = "Replace",
				    },
				    -- Diagnostics configuration
				    diagnostics = {
					    -- Recognize the vim global
					    globals = { "vim" },
				    },
			    },
			    -- Improve type checking
			    typeChecking = {
				    enable = true,
			    },
		    },
	    },
    },
    cssls == {
	    settings = {
		    css = {
			    lint = {
				    emptyRules = "ignore",
				    duplicateProperties = "warning",
			    },
		    },
		    scss = {
			    lint = {
				    idSelector = "warning",
				    zeroUnits = "warning",
				    duplicateProperties = "warning",
				    emptyRules = nil,
			    },
			    completion = {
				    completePropertyWithSemicolon = true,
				    triggerPropertyValueCompletion = true,
			    },
		    },
	    },
	    on_attach = function(client)
		    client.server_capabilities.document_formatting = false
	    end,
    },
    yamlls == {
	    settings = {
		    yaml = {
			    schemas = {
				    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
				    "docker-compose*.yml",
			    },
			    validate = true,
			    completion = true,
			    hover = true,
		    },
	    },
    },
    gopls == {
	    analyses = {
		    unusedparams = true,
		    staticcheck = true,
		    gofumpt = true, -- Requires gofumpt to be installed
	    },
	    completeUnimported = true,
	    usePlaceholders = true,
    }
