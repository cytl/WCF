{include file='header' pageTitle='wcf.acp.user.revertChanges'}

<header class="boxHeadline">
	<h1>{lang}wcf.acp.user.revertChanges{/lang}</h1>
</header>

{include file='formError'}

<div class="contentNavigation">
	{hascontent}
		<nav>
			<ul>
				{content}
					{event name='contentNavigationButtons'}
				{/content}
			</ul>
		</nav>
	{/hascontent}
</div>

<form method="post" action="{link controller='UserContentRevertChanges'}{/link}">
	<div class="container containerPadding marginTop">
		<fieldset>
			<legend>{lang}wcf.acp.user.revertChanges.markedUsers{/lang}</legend>
			
			<div>
				{implode from=$users item='user'}<a href="{link controller='UserEdit' id=$user->userID}{/link}">{$user}</a>{/implode}
			</div>
			
			{event name='markedUserFields'}
		</fieldset>
		
		<fieldset>
			<legend>{lang}wcf.acp.user.revertChanges.timeframe{/lang}</legend>
			
			<dl{if $errorField == 'timeframe'} class="formError"{/if}>
				<dt><label for="timeframe">{lang}wcf.acp.user.revertChanges.timeframe{/lang}</label></dt>
				<dd>
					<input name="timeframe" type="number" min="0" value="{$timeframe}" />
					
					{if $errorField == 'timeframe'}
						<small class="innerError">
							{if $errorType == 'empty'}{lang}wcf.global.form.error.empty{/lang}{/if}
						</small>
					{/if}
					<small>{lang}wcf.acp.user.revertChanges.timeframe.description{/lang}</small>
				<dd>
			</dl>
			
			{event name='mergeFields'}
		</fieldset>
		
		{event name='fieldsets'}
	</div>
	
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
		{@SECURITY_TOKEN_INPUT_TAG}
	</div>
</form>

{include file='footer'}
