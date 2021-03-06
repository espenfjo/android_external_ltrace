/*
 * This file is part of ltrace.
 * Copyright (C) 2011,2012 Petr Machata, Red Hat Inc.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA
 */

#ifndef _CALLBACK_H_
#define _CALLBACK_H_

/* Notes on the iteration interface used across ltrace.  Typically the
 * iteration function looks something like this:
 *
 *   foo *each_foo(foo *start_after,
 *                 enum callback_status (*cb)(foo *f, void *data),
 *                 void *data);
 *
 * The iteration starts after the element designated by START_AFTER,
 * or at the first element if START_AFTER is NULL.  CB is then called
 * for each element of the collection.  DATA is passed verbatim to CB.
 * If CB returns CBS_STOP, the iteration stops and the current element
 * is returned.  That element can then be passed as START_AFTER to
 * restart the iteration.  NULL is returned when iteration ends.
 *
 * CBS_FAIL is not currently handled, and essentially means the same
 * thing as CBS_STOP.  There's no provision for returning error
 * states.  Errors need to be signaled to the caller via DATA,
 * together with any other data that the callback needs.
 */
enum callback_status {
	CBS_STOP, /* The iteration should stop.  */
	CBS_CONT, /* The iteration should continue.  */
	CBS_FAIL, /* There was an error.  The iteration should stop
		   * and return error.  */
};

#endif /* _CALLBACK_H_ */
