				{if $latest_jobs}
				<h2>{$translations.homepage.recent_jobs}</h2>
				<table id="job-posts" class="job-posts" cellspacing="0">
				{foreach item=job from=$latest_jobs}
					<tr>
						<td>
							{if $job.type_id == $smarty.const.JOBTYPE_FULLTIME}
							<img src="{$BASE_URL}img/icon-fulltime.png" alt="full-time" />
							{elseif $job.type_id == $smarty.const.JOBTYPE_PARTTIME}
							<img src="{$BASE_URL}img/icon-parttime.png" alt="part-time" />
							{elseif $job.type_id == $smarty.const.JOBTYPE_FREELANCE}
							<img src="{$BASE_URL}img/icon-freelance.png" alt="freelance" />
							{/if}
							<a href="{$BASE_URL}job/{$job.id}/{$job.url_title}/" title="{$job.title}">{$job.title}</a> <span class="la">{$translations.homepage.at}</span> {$job.company}{if $job.location == 'Anywhere'}, {$job.location}{else} <span class="la">{$translations.homepage.in}</span> {$job.location}{/if}
						</td>
						<td class="time-posted"><img src="{$BASE_URL}img/clock.gif" alt="" /> {$job.created_on}</td>
					</tr>
				{/foreach}
				</table>
				{/if}
				{if $most_applied_to_jobs}
				<br />
				<h3>{$translations.homepage.popular_jobs}</h3>
				<table id="job-posts3" class="job-posts" cellspacing="0">
				{foreach item=job from=$most_applied_to_jobs}
					<tr>
						<td>
							{if $job.type_id == $smarty.const.JOBTYPE_FULLTIME}
							<img src="{$BASE_URL}img/icon-fulltime.png" alt="full-time" />
							{elseif $job.type_id == $smarty.const.JOBTYPE_PARTTIME}
							<img src="{$BASE_URL}img/icon-parttime.png" alt="part-time" />
							{elseif $job.type_id == $smarty.const.JOBTYPE_FREELANCE}
							<img src="{$BASE_URL}img/icon-freelance.png" alt="freelance" />
							{/if}
							<a href="{$BASE_URL}job/{$job.id}/{$job.url_title}/" title="{$job.title}">{$job.title}</a> <span class="la">{$translations.homepage.at}</span> {$job.company}{if $job.location == 'Anywhere'}, {$job.location}{else} <span class="la">{$translations.homepage.in}</span> {$job.location}{/if}
						</td>
						<td class="time-posted"><strong>{$job.apps}</strong> {$translations.homepage.applicants}</td>
					</tr>
				{/foreach}
				</table>
				{/if}
				{if !$latest_jobs && !$most_applied_to_jobs}
				<br />
				<p>
					{$translations.homepage.no_jobs}.<br />
					<a href="{$BASE_URL}post/" title="{$translations.footer.new_job_title}">{$translations.footer.new_job}</a>?
				</p>
				{/if}