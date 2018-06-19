<?php
/**
 * i-MSCP - internet Multi Server Control Panel
 * Copyright (C) 2010-2018 by Laurent Declercq <l.declercq@nuxwin.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

namespace iMSCP;

use iMSCP\Authentication\AuthenticationService;
use iMSCP\Functions\Counting;
use iMSCP\Functions\HelpDesk;
use iMSCP\Functions\View;

require_once 'application.php';

Application::getInstance()->getAuthService()->checkIdentity(AuthenticationService::RESELLER_IDENTITY_TYPE);
Application::getInstance()->getEventManager()->trigger(Events::onResellerScriptStart);
Counting::resellerHasFeature('support') or View::showBadRequestErrorPage();

$previousPage = 'ticket_system';

$identity = Application::getInstance()->getAuthService()->getIdentity();

if (isset($_GET['ticket_id']) && !empty($_GET['ticket_id'])) {
    $ticketId = intval($_GET['ticket_id']);
    $stmt = execQuery('SELECT ticket_status FROM tickets WHERE ticket_id = ? AND (ticket_from = ? OR ticket_to = ?)', [
        $ticketId, $identity->getUserId(), $identity->getUserId()
    ]);

    if (!$stmt->rowCount()) {
        View::setPageMessage(tr("Ticket with Id '%d' was not found.", $ticketId), 'error');
        redirectTo($previousPage . '.php');
    }

    // The ticket status was 0 so we come from ticket_closed.php
    if ($stmt->fetchColumn() == 0) {
        $previousPage = 'ticket_closed';
    }

    HelpDesk::deleteTicket($ticketId);
    View::setPageMessage(tr('Ticket successfully deleted.'), 'success');
    writeLog(sprintf('%s: deleted ticket %d', getProcessorUsername($identity), $ticketId), E_USER_NOTICE);
} elseif (isset($_GET['delete']) && $_GET['delete'] == 'open') {
    HelpDesk::deleteTickets('open', $identity->getUserId());
    View::setPageMessage(tr('All open tickets were successfully deleted.'), 'success');
    writeLog(sprintf('%s: deleted all open tickets.', getProcessorUsername($identity)), E_USER_NOTICE);
} elseif (isset($_GET['delete']) && $_GET['delete'] == 'closed') {
    HelpDesk::deleteTickets('closed', $identity->getUserId());
    View::setPageMessage(tr('All closed tickets were successfully deleted.'), 'success');
    writeLog(sprintf('%s: deleted all closed tickets.', getProcessorUsername($identity)), E_USER_NOTICE);
    $previousPage = 'ticket_closed';
} else {
    View::setPageMessage(tr('Unknown action requested.'), 'error');
}

redirectTo($previousPage . '.php');