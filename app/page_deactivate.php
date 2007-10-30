<?php
	$j = new Job($id);
	// if auth code used, check it and allow editing
	if (($_SESSION['later_edit'] == $j->GetAuth()) || ($extra != '' && $extra == $j->GetAuth()))
	{
		$deleter = $j->Deactivate();
		$_SESSION['status'] = 'Anunţul tău a fost şters.';	
		redirect_to(BASE_URL);
		exit;
	}

	if ($_SERVER['HTTP_REFERER'] == BASE_URL . 'verifica/' . $id . '/' && $id != 0 && $_SERVER['REMOTE_ADDR'] == $_SESSION['user_ip'])
	{
		$job = new Job($id);
		if ($job->GetTempStatus() == 1 || $job->GetActiveStatus() == 0)
		{
			$info = $job->Deactivate();
			$_SESSION['status'] = 'Anunţul tău nu a fost publicat.';
			redirect_to(BASE_URL);
			exit;
		}
		else
		{
			redirect_to(BASE_URL);
			exit;
		}
	}
	else
	{
		redirect_to(BASE_URL . 'job/' . $id . '/');
		exit;
	}
?>